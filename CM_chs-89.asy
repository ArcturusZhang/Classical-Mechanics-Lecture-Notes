if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-89";
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
//第六章例6图
pair O,dash,P;
real alpha,r,d;
O = (0,0);
r = 1;
d = 0.05;
alpha = 30;
fill(rotate(alpha)*box((r-d,-2*r),(r+d,2*r)),0.6white);
draw(Label("$z$",EndPoint),O--2.5*r*dir(alpha),Arrow);
draw(Label("$Z$",EndPoint),O--2.5*r*dir(90),Arrow);
draw(Label("$\boldsymbol{\omega}_0$",EndPoint,black),O--2.5*r*dir(alpha+(90-alpha)/2),red,Arrow);
draw((-r/2,0)--(r/2,0));
dash = 2*d*dir(-120);
for(int i=1;i<=6;i=i+1){
P = (r/2-r/6*(i-1),0);
draw(P--P+dash);
}
label("$O$",O,NW);
label("$C$",r*dir(alpha),2*E);
label("$r$",1/2*r*dir(alpha),dir(alpha-90));
label("$2r$",r*dir(alpha)+r*dir(alpha-90),dir(alpha-180));
draw(Label("$\dfrac{\alpha}{2}$",Relative(0.3),Relative(E)),arc(O,0.4*r,alpha,alpha+(90-alpha)/2),Arrow);
draw(Label("$\dfrac{\alpha}{2}$",Relative(0.5),Relative(E)),arc(O,0.4*r,alpha+(90-alpha)/2,90),Arrow);
//draw(O--(2.5,0),invisible);
