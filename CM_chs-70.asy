if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-70";
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
size(350);
import graph;
import math;
//第六章例2图
picture tmp;
pair O,i,j,k;
real R,a,phi;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
R = 2.5;
a = 1;
phi = 5/6*pi;
pair cir(real theta){
return R*cos(theta)*i+R*sin(theta)*j;
}
pair pln(real theta){
real x,y,z;
x = R*cos(phi)+a*cos(theta)*sin(phi);
y = R*sin(phi)-a*cos(theta)*cos(phi);
z = a+a*sin(theta);
return x*i+y*j+z*k;
}
real inner(pair v1,pair v2){
return v1.x*v2.x+v1.y*v2.y;
}
path plate;
draw(Label("$Z$",EndPoint),O--3*a*k,Arrow);
draw(graph(cir,0,2*pi),dashed);
plate = graph(pln,0,2*pi)--cycle;
draw(plate,linewidth(0.8bp));
pair OO,C,RC,P,yy,dpsi,dphi,omega;
real x1,x2;
OO = a*k;
C = R*cos(phi)*i+R*sin(phi)*j+a*k;
RC = R*cos(phi)*i+R*sin(phi)*j;
P = pln(2/3*pi);
yy = pln(2/3*pi-pi/2);
dot(O);
label("$O$",OO,SE);
dot(C);
label("$C$",C,S);
draw(OO--C);
//draw(Label("$y$",EndPoint),C--yy,Arrow);
draw(Label("$z$",EndPoint),C--interp(OO,C,-0.8),Arrow);
dot(P);
label("$P$",P,NW);
draw(Label("$a$",MidPoint,Relative(W)),C--P,dashed);
draw(Label("$x$",EndPoint),OO--OO+(P-C),Arrow);
draw(OO+(P-C)--P,dashed);
draw(Label("$\boldsymbol{r}_P$",MidPoint,Relative(E),black),OO--P,blue,Arrow);
dphi = k;
dpsi = dir(OO-C);
omega = dir(RC-OO);
x1 = -(inner(dpsi,dpsi)*inner(omega,dphi)-inner(dphi,dpsi)*inner(omega,dpsi))/(inner(dphi,dphi)*inner(dpsi,dpsi)-inner(dphi,dpsi)**2);
x2 = -(inner(dphi,dphi)*inner(omega,dpsi)-inner(dphi,dpsi)*inner(omega,dphi))/(inner(dphi,dphi)*inner(dpsi,dpsi)-inner(dphi,dpsi)**2);
dphi = x1*dphi;
dpsi = x2*dpsi;
draw(RC--OO,dashed);
draw(Label("$\dot{\boldsymbol{\psi}}$",EndPoint,Relative(W),black),OO--OO+dpsi,red,Arrow);
draw(Label("$\dot{\boldsymbol{\phi}}$",EndPoint,Relative(E),black),OO--OO+dphi,red,Arrow);
draw(Label("$\boldsymbol{\omega}$",EndPoint,black),OO--OO+dphi+dpsi,red,Arrow);
draw(OO+dpsi--OO+dpsi+dphi--OO+dphi,dashed);
draw(Label("$R$",MidPoint,Relative(E)),O--RC,dashed);
label("$Q$",RC,dir(70));
label("$O'$",O,W);
draw(C--pln(0),dashed);
a = 0.3;
draw(Label("$\psi$",MidPoint,Relative(E)),shift((1-a)*k)*graph(pln,0,2/3*pi),Arrow);
draw(Label("$X$",EndPoint),O--3*i,Arrow);
draw(Label("$Y$",EndPoint),O--3*j,Arrow);
R = 0.4;
draw(Label("$\phi$",MidPoint,Relative(E)),graph(cir,0,phi),Arrow);
