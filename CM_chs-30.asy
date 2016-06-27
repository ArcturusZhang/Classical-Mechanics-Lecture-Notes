if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-30";
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
size(200);
//球面短程线示意图
real hd,hdd;
pair O,i,j,k,en;
real r,theta0,phi0;
O = (0,0);
r = 2;
label("$O$",O,NW);
draw(shift(O)*scale(r)*unitcircle);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
theta0 = pi/6;
phi0 = 1.5;
en = sin(theta0)*cos(phi0)*i+sin(theta0)*sin(phi0)*j+cos(theta0)*k;
dot(r*en,red);
draw(O--r*en,red+dashed);
draw(Label("$\boldsymbol{e}_n$",EndPoint,W,black),r*en--r*en+en,red,Arrow);

pair cir(real phi){
real theta,u,x,y,z;
if(phi==phi0){
theta = pi/2;
}
else{
u = -1./cos(phi-phi0)/tan(theta0);
if(u<0){
theta = pi-atan(-u);
}
else{
theta = atan(u);
}
}
x = r*sin(theta)*cos(phi);
y = r*sin(theta)*sin(phi);
z = r*cos(theta);
return x*i+y*j+z*k;
}
draw(graph(cir,pi/2,3*pi/2),blue+dashed);
draw(graph(cir,3*pi/2,2*pi+pi/2),blue);
real theta,theta2;
theta = -0.1*pi;
theta2 = 0.3*pi;
draw(graph(cir,theta,theta2),blue+linewidth(1.5bp));
draw(Label("$\boldsymbol{r}_A$",MidPoint,Relative(E)),O--cir(theta),dashed,Arrow);
label("$A$",cir(theta),SW);
dot(cir(theta));
draw(Label("$\boldsymbol{r}_B$",MidPoint,Relative(W)),O--cir(theta2),dashed,Arrow);
label("$B$",cir(theta2),S);
dot(cir(theta2));
theta = 0.13*pi;
draw(Label("$\boldsymbol{r}$",MidPoint,Relative(E)),O--cir(theta),dashed,Arrow);
dot(cir(theta));
