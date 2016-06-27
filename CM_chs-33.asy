if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-33";
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
//抛物线坐标系的坐标面
pair O,i,j,k;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
draw(-3*k--2.6*k,dashed);
draw(Label("$z$",EndPoint),2.6*k--4*k,Arrow);
real u0,v0,h0,phi0,h,r;
pair f1(real h){
real theta,tmp,phi;
theta = atan(-j.x/i.x);
tmp = v0/sqrt(v0^2+2*h)*(i.x*j.y-i.y*j.x)/k.y/sqrt(i.x^2+j.x^2);
phi = asin(tmp)-theta;
return sqrt(v0^2+2*h)*v0*cos(phi)*i+sqrt(v0^2+2*h)*v0*sin(phi)*j+h*k;
}
pair f2(real h){
real theta,tmp,phi;
theta = atan(-j.x/i.x);
tmp = -u0/sqrt(u0^2-2*h)*(i.x*j.y-i.y*j.x)/(k.y*sqrt(i.x^2+j.x^2));
phi = asin(tmp)-theta;
return sqrt(u0^2-2*h)*u0*cos(phi)*i+sqrt(u0^2-2*h)*u0*sin(phi)*j+h*k;
}
pair para_up(real phi){
real x,y,z,u;
u = sqrt(v0^2+2*h);
x = u*v0*cos(phi);
y = u*v0*sin(phi);
z = h;
return x*i+y*j+z*k;
}
pair para_down(real phi){
real x,y,z,v;
v = sqrt(u0^2-2*h);
x = u0*v*cos(phi);
y = u0*v*sin(phi);
z = h;
return x*i+y*j+z*k;
}
pair intersection_cur_up(real h){
real x,y,z,u;
u = sqrt(v0^2+2*h);
x = u*v0*cos(phi0);
y = u*v0*sin(phi0);
z = h;
return x*i+y*j+z*k;
}
pair intersection_cur_down(real h){
real x,y,z,v;
v = sqrt(u0^2-2*h);
x = u0*v*cos(phi0);
y = u0*v*sin(phi0);
z = h;
return x*i+y*j+z*k;
}
path q1,q2,p1,p2;
picture tmp;
v0 = 0.6;
u0 = 0.8;
h0 = 0.5*(u0^2-v0^2);
q1 = graph(f1,3,h0);
p1 = graph(f1,h0,-0.5*v0^2+0.1);
draw(q1,linewidth(0.8bp)+red);
draw(p1..xscale(-1)*reverse(p1),dashed+red);
q2 = graph(f2,-3,h0);
p2 = graph(f2,h0,0.5*u0^2-0.1);
draw(q2,linewidth(0.8bp)+blue);
draw(p2..xscale(-1)*reverse(p2),dashed+blue);
real tm;
tm = -1.2;
h = h0;
draw(graph(para_up,tm,pi+tm),green+linewidth(0.8bp));
draw(graph(para_up,pi+tm,2*pi+tm),dashed+green);
h = 3;
draw(graph(para_up,0,2*pi),red);
h = -3;
draw(graph(para_down,pi+tm,2*pi+tm),dashed+blue);
phi0 = pi/3;
r = 3;
draw(tmp,graph(para_down,tm,pi+tm),blue);
draw(tmp,xscale(-1)*q1,linewidth(0.8bp)+red);
draw(tmp,xscale(-1)*q2,linewidth(0.8bp)+blue);
draw(tmp,Label("$y$",EndPoint),O--3*j,Arrow);
path clp;
clp = 3*k--r*cos(phi0)*i+r*sin(phi0)*j+3*k--r*cos(phi0)*i+r*sin(phi0)*j-3*k--(-3*k)--cycle;
unfill(tmp,clp);
add(tmp);
erase(tmp);
draw(tmp,graph(para_down,tm,pi+tm),blue+dashed);
draw(tmp,xscale(-1)*q1,dashed+red);
draw(tmp,xscale(-1)*q2,dashed+blue);
draw(tmp,Label("$y$",EndPoint),O--3*j,dashed);
clip(tmp,clp);
add(tmp);
draw(3*k--r*cos(phi0)*i+r*sin(phi0)*j+3*k--r*cos(phi0)*i+r*sin(phi0)*j-3*k--intersection_cur_down(-3),green);
draw(intersection_cur_down(-3)--(-3*k),green+dashed);
draw(graph(intersection_cur_up,3,h0),red+linewidth(0.8bp));
draw(graph(intersection_cur_up,h0,-0.5*v0^2),red+dashed);
draw(graph(intersection_cur_down,-3,h0),blue+linewidth(0.8bp));
draw(graph(intersection_cur_down,h0,0.5*u0^2),blue+dashed);
dot(intersection_cur_up(h0));
draw(Label("$x$",EndPoint),u0^2*i--6*i,Arrow);
draw(O--u0^2*i,dashed);
pair P,eu,ev,ephi;
eu = v0*cos(phi0)/sqrt(u0^2+v0^2)*i+v0*sin(phi0)/sqrt(u0^2+v0^2)*j+u0/sqrt(u0^2+v0^2)*k;
ev = u0*cos(phi0)/sqrt(u0^2+v0^2)*i+u0*sin(phi0)/sqrt(u0^2+v0^2)*j-v0/sqrt(u0^2+v0^2)*k;
ephi = -sin(phi0)*i+cos(phi0)*j;
P = intersection_cur_up(h0);
draw(Label("$\boldsymbol{e}_u$",EndPoint),P--P+eu,Arrow);
draw(Label("$\boldsymbol{e}_v$",EndPoint),P--P+ev,Arrow);
draw(Label("$\boldsymbol{e}_\phi$",EndPoint),P--P+ephi,Arrow);
label("$O$",O,WNW);
