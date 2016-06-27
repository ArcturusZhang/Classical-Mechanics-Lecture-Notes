if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-122";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("siunitx");
import graph;
import math;
size(200);
//48页5.28受力分析
picture tmp;
pair O,dash,P,C;
real l,alpha,rate,ddash,d;
path wall;
O = (0,0);
l = 2;
alpha = 35;
rate = 0.5;
wall = l*dir(90)--O--l*dir(0);
dash = dir(-135);
draw(tmp,wall,linewidth(1bp));
for(real r=0;r<=1;r=r+0.01){
P = relpoint(wall,r);
draw(tmp,P--P+dash);
}
ddash = 0.05;
clip(tmp,box((-ddash,-ddash),(1.1*l*Sin(alpha),1.1*l*Cos(alpha))));
add(tmp);
d = 0.05;
draw(l*Sin(alpha)*dir(0)--l*Sin(alpha)*dir(0)+d*dir(alpha)--l*Cos(alpha)*dir(90)+d*dir(alpha)--l*Cos(alpha)*dir(90)--cycle,linewidth(0.8bp));
C = interp(l*Cos(alpha)*dir(90)+0.5*d*dir(alpha),l*Sin(alpha)*dir(0)+0.5*d*dir(alpha),rate);
dot(C);
draw(Label("$\boldsymbol{P}$",EndPoint),C--C+0.55*dir(-90),Arrow);
label("$A$",l*Cos(alpha)*dir(90),2*W);
label("$B$",1.1*l*Sin(alpha)*dir(0),N);
//label("$C$",C,dir(alpha-180));
draw(Label("$\alpha$",MidPoint,Relative(E)),arc(l*Sin(alpha)*dir(0),0.1,90+alpha,180),Arrows);
draw(Label("$\boldsymbol{p}$",EndPoint,Relative(W)),l*Cos(alpha)*dir(90)--l*Cos(alpha)*dir(90)+0.4*dir(-90),Arrow);
draw(Label("$\boldsymbol{N}_A$",EndPoint),l*Cos(alpha)*dir(90)--l*Cos(alpha)*dir(90)+0.4*dir(0),Arrow);
draw(Label("$\boldsymbol{f}_B$",EndPoint,Relative(E)),l*Sin(alpha)*dir(0)--l*Sin(alpha)*dir(0)+0.4*dir(180),Arrow);
draw(Label("$\boldsymbol{N}_B$",EndPoint),l*Sin(alpha)*dir(0)--l*Sin(alpha)*dir(0)+0.6*dir(90),Arrow);
