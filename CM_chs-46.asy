if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-46";
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
size(250);
//各种情形下轨道的形状
pair O;
real p,e[],ee,xmax,ymax;
picture tmp;
O = (0,0);
real r(real theta){
return p/(1+ee*cos(theta));
}
real nr(real theta){
return p/(ee*cos(theta)-1);
}
pair xy(real theta){
return (r(theta)*cos(theta),r(theta)*sin(theta));
}
pair nxy(real theta){
return (nr(theta)*cos(theta),nr(theta)*sin(theta));
}
p = 1;
e[1] = 0.4;
ee = e[1];
draw(tmp,graph(xy,0,2*pi),green+linewidth(1bp));
e[2] = 1;
ee = e[2];
draw(tmp,graph(xy,-0.7*pi,0.7*pi),linewidth(1bp));
e[3] = 2.5;
ee = e[3];
draw(tmp,graph(xy,-0.6*pi,0.6*pi),blue+linewidth(1bp));
//draw(tmp,graph(nxy,-0.34*pi,0.34*pi),purple+linewidth(1bp));
draw(tmp,scale(p)*unitcircle,red+linewidth(1bp));
draw(tmp,(-100,0)--(100,0));
draw(tmp,(0,-100)--(0,100));
label(tmp,"$p$",(0,p/2),W);
dot(tmp,O);
xmax = p/(1-e[1])*1.1;
ymax = xmax;
path clp = box((-xmax,-ymax),(xmax,ymax));
clip(tmp,clp);
add(tmp);
ee = e[1];
label("$U_{\mathrm{min}}<E<0$",xy(-0.7*pi),SW,green);
label("$E=0$",(-0.7*xmax,ymax),N);
label("$E>0$",(-0.25*xmax,ymax),N,blue);
//label("$\alpha<0$",(-0.25*xmax,-ymax),S,blue);
label("$E>0$",(0.7*xmax,ymax),N,purple);
//label("$\alpha>0$",(0.7*xmax,-ymax),S,purple);
label("$E=U_{\mathrm{min}}$",relpoint(scale(p)*unitcircle,0.06),E,red);
