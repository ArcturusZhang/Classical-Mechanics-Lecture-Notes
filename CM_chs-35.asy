if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-35";
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
usepackage("siunitx");
import graph;
import math;
size(300);
//行星的轨道示意图
pair O,i,j,k;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
real r;
r = 1;
draw(scale(r)*unitcircle,linewidth(0.8bp));
real theta0,phi0,phi;
theta0 = 0.3*pi;
phi0 = pi/6;
pair xyplane(real t){
return r*cos(t)*i+r*sin(t)*j;
}
pair yzplane(real t){
return r*cos(t)*j+r*sin(t)*k;
}
pair zxplane(real t){
return r*cos(t)*k+r*sin(t)*i;
}
pair planetplane(real phi){
real m,st,ct;
m = sin(phi-phi0)/tan(theta0);
st = 1/sqrt(m^2+1);
ct = m/sqrt(m^2+1);
return st*cos(phi)*i+st*sin(phi)*j+ct*k;
}
pair pqplane(real t){
return r*cos(t)*cos(phi0)*i+r*cos(t)*sin(phi0)*j+r*sin(t)*k;
}
real gettheta_forplanet(real phi,real phi0){
real m;
m = sin(phi-phi0)/tan(theta0);
return asin(1/sqrt(m^2+1));
}
real tmp;
tmp = -1.1;
draw(graph(xyplane,tmp,pi+tmp));
draw(graph(xyplane,pi+tmp,2*pi+tmp),dashed);
tmp = -0.8;
draw(graph(yzplane,tmp,pi+tmp));
draw(graph(yzplane,pi+tmp,2*pi+tmp),dashed);
tmp = -0.2;
draw(graph(zxplane,tmp,pi+tmp));
draw(graph(zxplane,pi+tmp,2*pi+tmp),dashed);
tmp = -1;
draw(graph(planetplane,tmp,pi+tmp),red+linewidth(0.8bp));
draw(graph(planetplane,pi+tmp,2*pi+tmp),dashed+red);
pair n,m,q,p,b;
n = intersectionpoint(graph(planetplane,tmp,pi+tmp),graph(xyplane,tmp,pi+tmp));
m = intersectionpoint(graph(planetplane,pi+tmp,2*pi+tmp),graph(xyplane,pi+tmp,2*pi+tmp));
draw(Label("$\boldsymbol{n}$",MidPoint,Relative(E)),O--n,Arrow);
label("$N$",n,S);
label("$M$",m,N);
phi = 1;
p = planetplane(phi);
q = r*cos(phi)*i+r*sin(phi)*j;
draw(Label("$\boldsymbol{q}$",MidPoint,Relative(W)),O--p,Arrow);
label("$P$",p,E);
draw(O--q,dashed);
label("$Q$",q,SE);
draw(Label("$\varOmega$",MidPoint,Relative(E)),graph(xyplane,0,phi0),blue+linewidth(0.8bp));
draw(Label("$\phi-\varOmega$",MidPoint,Relative(E)),graph(xyplane,phi0,phi),green+linewidth(0.8bp));
draw(Label("$\varTheta$",Relative(0.65),Relative(E)),graph(planetplane,phi0,phi),purple+linewidth(0.8bp));
b = sin(phi0)*cos(theta0)*i-cos(phi0)*cos(theta0)*j+sin(theta0)*k;
draw(Label("$\boldsymbol{b}$",EndPoint,W),O--b,Arrow);
tmp = -1.2;
phi0 = phi;
draw(graph(pqplane,tmp,pi+tmp),orange);
draw(graph(pqplane,pi+tmp,2*pi+tmp),dashed+orange);
draw(Label("$\theta$",MidPoint,Relative(E)),graph(pqplane,pi/2-gettheta_forplanet(phi,pi/6),pi/2),orange+blue+linewidth(0.8bp));
draw(O--r*i,dashed);
draw(O--r*j,dashed);
draw(O--r*k,dashed);
draw(Label("$x$",EndPoint),r*i--2.5*r*i,Arrow);
draw(Label("$y$",EndPoint),r*j--1.5*r*j,Arrow);
draw(Label("$z$",EndPoint),r*k--1.5*r*k,Arrow);
label("$O$",O,2*W);
