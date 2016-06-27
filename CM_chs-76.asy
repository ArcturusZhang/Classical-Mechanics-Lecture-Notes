if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-76";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("amssymb");
size(200);
import graph;
import math;
//对称Euler陀螺的角速度矢量
picture tmp;
pair O,i,j,k;
real r,h,rr,pos;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
pos = 1.6;
draw(Label("$x$",EndPoint),O--2*i,Arrow);
draw(Label("$y$",EndPoint),O--2*j,Arrow);
draw(Label("$z$",EndPoint),O--2*k,Arrow);
label("$O$",O,W);
r = 1;
h = 1.5;
rr = 0.4;
pair cir(real theta){
return r*cos(theta)*i+r*sin(theta)*j+h*k;
}
pair bot(real theta){
return rr*cos(theta)*i+rr*sin(theta)*j;
}
draw(graph(cir,0,2*pi),dashed);
draw(O--cir(pos),dashed);
draw(xscale(-1)*(O--cir(pos)),dashed);
draw(Label("$\alpha$",MidPoint,Relative(W)),arc(O,rr,90,degrees(cir(pos))),Arrow);
draw(Label("$\boldsymbol{\omega}$",EndPoint,black),O--cir(pi/3),red,Arrow);
draw(Label("$\boldsymbol{\omega}_0$",EndPoint,black),O--cir(pi/3)-h*k,red,Arrow);
draw(Label("$\boldsymbol{\varOmega}$",EndPoint,Relative(W),black),O--h*k,red,Arrow);
draw(h*k--cir(pi/3)--cir(pi/3)-h*k,dashed);
draw(Label("$nt+\varepsilon$",MidPoint,Relative(E)),graph(bot,0,pi/3),Arrow);
