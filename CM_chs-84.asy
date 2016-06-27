if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-84";
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
//Lagrange陀螺等效势能曲线
picture tmp;
pair O;
real mgl,LZ,L3,I1,I3,x,thetam,theta1,theta2,theta0,bot,top;
path clp;
real U(real theta){
return mgl*cos(theta)+(LZ-L3*cos(theta))*(LZ-L3*cos(theta))/(2*I1*sin(theta)*sin(theta)) + L3*L3/(2*I3);
}
real dU(real theta){
return -mgl*sin(theta)+(L3*(sin(theta))**2*(LZ-L3*cos(theta))-sin(theta)*cos(theta)*(LZ-L3*cos(theta))**2)/(I1*(sin(theta))**3);
}
real Utheta1(real theta){
return mgl*cos(theta)+(LZ-L3*cos(theta))*(LZ-L3*cos(theta))/(2*I1*sin(theta)*sin(theta)) + L3*L3/(2*I3)-U(theta1);
}
real bis(real f(real),real x1,real x2,real eps){
int imax;
real a,b,fab,fa,fb;
a = x1;
b = x2;
imax = 1000;
for(int i=1;i<=imax;i=i+1){
fa = f(a);
fb = f(b);
fab = f((a+b)/2);
if(fab == 0) return (a+b)/2;
if(fab*fa<0){
b = (a+b)/2;
}
else {
a = (a+b)/2;
}
if(abs(b-a)<eps){
return (a+b)/2;
}
}
return (a+b)/2;
}
mgl = 10;
LZ = -.6;
L3 = 2;
I1 = 2;
I3 = 1;
x = 20;
bot = -10;
top = 60;
draw(tmp,xscale(x)*graph(U,0.01,pi-0.01),linewidth(1bp));
clp = box((0,bot),(x*pi,80));
clip(tmp,clp);
draw(tmp,clp);
clp = box((-1,bot),(x*pi,top));
clip(tmp,clp);
add(tmp);
thetam = bis(dU,2,3,1e-10)-0.04;
draw((0,U(thetam))--(x*pi,U(thetam)),red);
draw((x*thetam,bot)--(x*thetam,U(thetam)),dashed);
theta1 = 1.7;
theta2 = bis(Utheta1,2,3,1e-10);
theta0 = acos(LZ/L3);
draw((0,U(theta1))--(x*pi,U(theta1)),blue);
draw((x*theta1,bot)--(x*theta1,U(theta1)),dashed);
draw((x*theta2,bot)--(x*theta2,U(theta2)),dashed);
//draw((0,U(theta0))--(x*pi,U(theta0)),dashed+green);
//draw((x*theta0,bot)--(x*theta0,U(theta0)),dashed+green);
label("$0$",(x*0,bot),S);
label("$\theta_1$",(x*theta1,bot),S);
label("$\theta_m$",(x*thetam,bot),S);
label("$\theta_2$",(x*theta2,bot),S);
//label("$\theta_0$",(x*theta0,bot),S);
label("$\pi$",(x*pi,bot),S);
label("$\theta$",(x*pi,bot),E);
label("$E$",(0,U(theta1)),W);
label("$U$",(0,top),N);
