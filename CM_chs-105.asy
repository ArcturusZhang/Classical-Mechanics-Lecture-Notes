if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-105";
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
size(300);
//理论力学：146页4.7
pair O,i,j,k,O1;
real h,r,x,y,z,r0;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
x = 1;
y = 1.5;
z = 1;
h = 1.2;
r = 0.3;
draw(Label("$X$",EndPoint),O--x*i,Arrow);
draw(Label("$Y$",EndPoint),O--y*j,Arrow);
draw(Label("$Z$",EndPoint),O--z*k,Arrow);
label("$O$",O,NW);
pair cir(real theta){
real xi,eta,x,y,z;
xi = r*cos(theta);
eta = r*sin(theta);
x = xi;
y = sqrt(r**2+h**2) - (r+eta)*r/sqrt(r**2+h**2);
z = (r+eta)*h/sqrt(r**2+h**2);
return x*i+y*j+z*k;
}
pair ang(real theta){
real x,y;
x = r0*cos(theta);
y = r0*sin(theta);
return x*i+y*j;
}
pair tritopair(triple P){
return P.x*i+P.y*j+P.z*k;
}
path p;
p = graph(cir,0,2*pi,200);
draw(p,linewidth(1bp));
//求路径p的最高点和最低点
pair toppoint(path p,real fuzz=0.01){
pair P,Q;
P = relpoint(p,0);
for(real rp=0;rp<=1;rp=rp+fuzz){
Q = relpoint(p,rp);
if(Q.y>P.y) P=Q;
}
return P;
}
pair botpoint(path p,real fuzz=0.01){
pair P,Q;
P = relpoint(p,0);
for(real rp=0;rp<=1;rp=rp+fuzz){
Q = relpoint(p,rp);
if(Q.y<P.y) P=Q;
}
return P;
}
label("$A$",toppoint(p,0.001),N);
draw(O--toppoint(p,0.001),linewidth(1bp));
draw(O--botpoint(p,0.001),linewidth(1bp));
O1 = tritopair((0,h*h/sqrt(h**2+r**2),h*r/sqrt(h**2+r**2)));
draw(Label("$h$",MidPoint,Relative(W)),O--O1,dashed);
draw(Label("$z$",EndPoint),O1--interp(O,O1,1.3),Arrow);
draw(Label("$\alpha$",MidPoint,Relative(E)),arc(O,0.15,degrees(O1),degrees(toppoint(p,0.001))));
draw(Label("$\theta$",MidPoint,Relative(W)),arc(O,0.3,90,degrees(O1)),Arrow);
r0 = 0.2;
draw(Label("$\phi$",MidPoint,Relative(E)),graph(ang,0,pi/2),Arrow);
