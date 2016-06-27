if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-95";
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
//地球表面的坐标系
pair O,i,j,k;
real x,y,z,r;
path clp;
picture tmp;
O = (0,0);
x = 2.5;
y = 1.5;
z = 1.5;
r = 1;
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
draw(Label("$x$",EndPoint),O--x*i,Arrow);
draw(Label("$y$",EndPoint),O--y*j,Arrow);
draw(Label("$z$",EndPoint),O--z*k,Arrow);
clp = r*i--r*j--r*k--cycle;
unfill(clp);
draw(tmp,Label("$x_0$",EndPoint),O--x*i,dashed,Arrow);
draw(tmp,Label("$y_0$",EndPoint),O--y*j,dashed,Arrow);
draw(tmp,Label("$z_0$",EndPoint),O--z*k,dashed,Arrow);
label(tmp,"$O$",O,NW);
clip(tmp,clp);
add(tmp);
erase(tmp);
real phi,theta;
pair vcir(real t){
return r*sin(t)*cos(phi)*i+r*sin(t)*sin(phi)*j+r*cos(t)*k;
}
pair hcir(real t){
return r*sin(theta)*cos(t)*i+r*sin(theta)*sin(t)*j+r*cos(theta)*k;
}
pair sphcoor(real R,real theta,real phi){
return R*sin(theta)*cos(phi)*i+R*sin(theta)*sin(phi)*j+R*cos(theta)*k;
}
phi = 0;
draw(graph(vcir,-0.4,pi-0.4));
draw(graph(vcir,pi-0.4,2*pi-0.4),dashed);
phi = pi/2;
draw(graph(vcir,-0.9,pi-1));
draw(graph(vcir,pi-1,2*pi-0.9),dashed);
theta = pi/2;
draw(graph(hcir,-1,pi-1.2));
draw(graph(hcir,pi-1.2,2*pi-1),dashed);
theta = pi/4;
draw(graph(hcir,-1.3,pi-1.1),orange);
draw(graph(hcir,pi-1.1,2*pi-1.3),dashed+orange);
phi = pi/3;
draw(graph(vcir,-0.5,pi-0.6),orange);
draw(graph(vcir,pi-0.6,2*pi-0.5),dashed+orange);
draw(scale(r)*unitcircle,linewidth(1bp));
pair P,Q,er,et,ep;
P = sphcoor(r,theta,phi);
Q = sphcoor(r,pi/2,phi);
er = 0.6*sphcoor(r,theta,phi);
et = 0.6*sphcoor(r,theta+pi/2,phi);
ep = 0.6*sphcoor(r,pi/2,phi+pi/2);
draw(Label("$A$",EndPoint,ESE),O--P,dashed);
draw(O--Q,dashed+orange);
draw(Label("$z$",EndPoint,black),P--P+er,red,Arrow);
draw(Label("$x$",EndPoint,Relative(W),black),P--P+et,red,Arrow);
draw(Label("$y$",EndPoint,black),P--P+ep,red,Arrow);
dot(P);
r = 0.3;
draw(Label("$\lambda$",MidPoint,Relative(E)),graph(vcir,pi/2,theta),Arrow);
