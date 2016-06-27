if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-102";
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
//理论力学：207页6.1
guide spring(real d,real h,int nmax){
guide gspring;
path springunit;
gspring = (0,0)--(d,h/2);
springunit = (d,h/2)--(-d,h/2+h)--(d,h/2+2*h);
for(int i=0;i<nmax-1;i=i+1){
gspring = gspring--shift(2*i*h*dir(90))*springunit;
}
gspring = gspring--shift(2*(nmax-1)*h*dir(90))*((-d,h/2+h)--(0,2*h));
return gspring;
}
picture dashpic;
pair O,P,dash;
real theta,d,l1,ls,l,r,h;
path tre;
O = (0,0);
theta = 30;
d = 0.05;
l1 = 0.6;
ls = 1.2;
l = 2.4;
r = 0.03;
draw(O--l*dir(-90),dashed);
draw(O--l1*dir(-90+theta)--shift(l1*dir(-90+theta))*rotate(-180+theta)*spring(d,ls/10/2,10)--l*dir(-90+theta),linewidth(1bp));
fill(shift(l*dir(-90+theta))*scale(r)*unitcircle,black);
label("$m$",l*dir(-90+theta),2*S);
label("$k$",(l1+ls/2)*dir(-90+theta),2*dir(theta));
r = 0.25;
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,r,-90,-90+theta));
tre = l*dir(180)--l*dir(0);
dash = l*dir(45);
draw(dashpic,tre,linewidth(1bp));
for(real rp=0;rp<=1;rp=rp+0.015){
P = relpoint(tre,rp);
draw(dashpic,P--P+dash);
}
h = 0.06;
clip(dashpic,box((-l1,-1),(l1,h)));
add(dashpic);
