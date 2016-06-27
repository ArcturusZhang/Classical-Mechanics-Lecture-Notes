if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-79";
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
//空间极锥与本体极锥情形2
picture tmp;
pair O,i,j,k;
real r,r1,r2,h,h1,h2,theta,alpha,pos,L;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
pos = 1.88;
r1 = 0.5;
r2 = 0.8;
h1 = 1.6;
h2 = sqrt(r1*r1+h1*h1-r2*r2);
L = 2;
pair cir(real theta){
return r*cos(theta)*i+r*sin(theta)*j+h*k;
}
theta = 0;
r = r2;
h = h2;
pos = 1.80;
draw(tmp,graph(cir,0,2*pi),red+dashed);
draw(tmp,O--cir(pos),red+dashed);
draw(tmp,xscale(-1)*(O--cir(pos)),red+dashed);
alpha = 90-degrees(cir(pos));
add(rotate(alpha+theta)*tmp);
draw(Label("$\boldsymbol{L}$",EndPoint,black),O--L*dir(90),blue,Arrow);
draw(Label("$\boldsymbol{e}_3$",EndPoint),O--L*dir(90+alpha+theta),Arrow);
//画角速度
real omega,r0;
omega = 1;
draw(Label("$\boldsymbol{\omega}$",EndPoint,Relative(E),black),O--omega*dir(90+theta),red,Arrow);
label("$\dot{\phi}$",0.8*omega*dir(90),E);
r0 = 0.3;
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,r0,90,90+alpha),Arrow);
r0 = 0.3;
draw(Label("$\alpha$",MidPoint,Relative(E)),arc(O,r0,90+alpha,90+2*alpha),Arrow);
