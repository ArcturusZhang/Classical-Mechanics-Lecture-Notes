if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-101";
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
size(250);
//理论力学：65页2.19
picture spring(real r,real d,int nmax){
picture springpic;
real theta0;
path clp;
pair prolate(real theta){
return (r*theta-d*sin(theta),-d*cos(theta));
}
real f(real theta){
return r*theta-d*sin(theta);
}
real fprime(real theta){
return r-d*cos(theta);
}
theta0 = newton(f,fprime,pi/2);
draw(springpic,graph(prolate,theta0,nmax*2*pi-theta0,10000)..((nmax+0.3)*2*pi*r,0)..((nmax+1)*2*pi*r,0),linewidth(0.8bp));
return springpic;
}
picture dashpic;
pair O,A,P,dash;
real l,theta,d1,d2,ldash,ddash,r0;
path tre;
O = (0,0);
l = 1;
theta = 50;
A = 2*l*Cos(theta)*dir(90);
draw(Label("$l$",MidPoint,Relative(E)),O--l*dir(90-theta));
draw(Label("$l$",MidPoint,Relative(E)),l*dir(90-theta)--A);
draw(Label("$l$",MidPoint,Relative(E)),A--l*dir(90+theta));
draw(Label("$l$",MidPoint,Relative(E)),l*dir(90+theta)--O);
d1 = 0.03;
d2 = 0.12;
unfill(shift(A)*box((-d1,-d2),(d1,d2)));
draw(A+(-d1,d2-2*d1/Tan(theta))--A+(-d1,-d2)--A+(d1,-d2)--A+(d1,d2-2*d1/Tan(theta)),linewidth(1bp));
add(shift(A+d2*dir(-90))*rotate(-90)*scale((length(A-O)-d2)/(21*2*pi*0.025))*spring(0.025,0.08,20));
label("$k$",(O+A)/2,2*W);
draw(O--A+2*d2*dir(90));
dot(O,UnFill);
label("$O$",O,S);
ddash = 1;
ldash = 1;
dash = ldash*dir(-135);
tre = ldash*dir(180)--ldash*dir(0);
draw(dashpic,tre,linewidth(1bp));
for(real r=0;r<=1;r=r+0.015){
P = relpoint(tre,r);
draw(dashpic,P--P+dash);
}
clip(dashpic,box((-3*d1,-d1),(3*d1,1)));
add(shift(A+2*d2*dir(90))*rotate(180)*dashpic);
erase(dashpic);
dash = ldash*dir(45);
tre = ldash*dir(-90)--ldash*dir(90);
for(real r=0;r<=1;r=r+0.015){
P = relpoint(tre,r);
draw(dashpic,P--P+dash);
}
clip(dashpic,box((0,-d2),(3*d1,d2)));
draw(dashpic,box((0,-d2),(3*d1,d2)),linewidth(1bp));
add(shift(l*dir(90-theta))*dashpic);
add(shift(l*dir(90+theta)+3*d1*dir(180))*dashpic);
label("$P$",l*dir(90-theta)+d2*dir(-90)+1.5*d1*dir(0),S);
label("$P$",l*dir(90+theta)+d2*dir(-90)+1.5*d1*dir(180),S);
r0 = 0.1;
draw(Label("$\theta$",Relative(0.4),Relative(E)),arc(O,r0,90-theta,90));
