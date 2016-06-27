if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-40";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
import graph;
import math;
size(300);
//进动的非闭合轨道
real p,e,omega,rmax,rmin;
pair O;
path g;
O = (0,0);
p = 1;
e = 0.7;
omega = 1-0.06;
rmax = p/(1-e);
rmin = p/(1+e);
pair rotell(real theta){
real r = p/(1+e*cos(omega*theta));
return (-r*cos(theta),r*sin(theta));
}
g = graph(rotell,16*pi/omega,-1.25*pi,10000);
draw(g);
for(real rp=1;rp>0;rp=rp-0.06){
add(arrow(g,invisible,FillDraw(black),Relative(rp)));
}
draw(scale(rmax)*unitcircle,dashed);
draw(scale(rmin)*unitcircle,dashed);
draw(rotell(15*pi/omega)--1.06*rotell(15*pi/omega));
draw(rotell(13*pi/omega)--1.06*rotell(13*pi/omega));
draw(Label("$\Delta \theta$",MidPoint,Relative(E)),arc(O,length(1.03*rotell(15*pi/omega)),degrees(rotell(15*pi/omega)),degrees(rotell(13*pi/omega))),Arrows);
draw(Label("$r_{\min}$",MidPoint,Relative(E)),O--rmin*dir(-20),Arrow);
draw(Label("$r_{\max}$",Relative(0.7),Relative(W)),O--rmax*dir(110),Arrow);
draw(O--(rmax+0.01)*dir(90),invisible);
