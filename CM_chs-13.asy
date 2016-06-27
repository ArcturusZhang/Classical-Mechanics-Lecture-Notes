if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-13";
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
//第一章例8图
real hd,hdd;
pair O,x,y,z;
hd = 131+25/60;
hdd = 7+10/60;
O = (0,0);
x = (-sqrt(2)/4,-sqrt(14)/12);
y = (sqrt(14)/4,-sqrt(2)/12);
z = (0,2*sqrt(2)/3);
draw(Label("$x$",EndPoint,W),(-1.5*x)--(1.5*x),Arrow);
draw(Label("$y$",EndPoint),(-1.2*y)--(1.2*y),Arrow);
draw(Label("$z$",EndPoint),(-1.2*z)--(0.5*z),Arrow);
real r,vec;
r = 1;
pair cirxy(real theta){
real xx,yy;
xx = r*cos(theta);
yy = r*sin(theta);
return xx*x+yy*y;
}
pair ciryz(real theta){
real yy,zz;
yy = r*cos(theta);
zz = r*sin(theta);
return yy*y+zz*z;
}
pair cirxz(real theta){
real xx,zz;
xx = r*cos(theta);
zz = r*sin(theta);
return xx*x+zz*z;
}
real phi,phi2;
pair Pcir(real theta){
real xx,yy,zz;
xx = r*cos(theta)*cos(phi);
yy = r*cos(theta)*sin(phi);
zz = r*sin(theta);
return xx*x+yy*y+zz*z;
}
pair Bcir(real theta){
real xx,yy,zz;
xx = r*cos(phi2)*cos(theta);
yy = r*cos(phi2)*sin(theta);
zz = r*sin(phi2);
return xx*x+yy*y+zz*z;
}
//画曲线
draw(arc(O,r,180,360));
draw(graph(cirxy,0,2*pi));
draw(graph(ciryz,pi,1.72*pi),dashed);
draw(graph(ciryz,1.72*pi,2*pi));
draw(graph(cirxz,pi,1.62*pi),dashed);
draw(graph(cirxz,1.62*pi,2*pi));
phi = pi/4;
draw(graph(Pcir,pi,1.62*pi),dashed);
draw(graph(Pcir,1.62*pi,2*pi));
draw(Pcir(pi)--Pcir(2*pi));
phi2 = 2*pi-pi/4;
pair P;
P = Pcir(phi2);
draw(graph(Bcir,-0.3*pi,0.5*pi));
draw(graph(Bcir,0.5*pi,2*pi-0.3*pi),dashed);
vec = 0.5;
draw(Label("$\boldsymbol{G}$",EndPoint),P--(P-vec*z),red,Arrow);
draw(Label("$\boldsymbol{N}$",EndPoint),P--(P-vec*Pcir(phi2)),red,Arrow);
draw(Label("$\boldsymbol{v}_\phi$",EndPoint,E,black),P--(P-vec*sin(phi)*x+vec*cos(phi)*y),orange,Arrow);
draw(Label("$\boldsymbol{v}_\theta$",EndPoint,S,black),P--(P+vec*sin(phi2)*cos(phi)*x+vec*sin(phi2)*cos(phi)*y-vec*cos(phi2)*z),orange,Arrow);
dot(P);
//draw(O--(1.5,0),invisible);
