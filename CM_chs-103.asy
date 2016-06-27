if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-103";
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
//理论力学：208页6.6
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
pair O,A,P,dash;
real theta,d,l1,ls,l,r,h,d1,d2,D1,D2;
path tre;
O = (0,0);
theta = 30;
d = 0.1;
l1 = 0.3;
ls = 1.8;
l = 2.2;
d1 = 0.6;
d2 = 0.6;
D1 = 5;
D2 = 2;
A = d2*dir(90)+(2*l1+ls+d1)*dir(0);
draw(O--D1*dir(0),linewidth(1bp));
draw(O--D2*dir(90),linewidth(1bp));
draw((0,d2)--shift(l1*dir(0)+(0,d2))*rotate(-90)*spring(d,ls/16,8)--(l1*2+ls)*dir(0)+(0,d2),linewidth(0.8bp));
draw(shift(A)*box((-d1,-d2),(d1,d2)),linewidth(0.8bp));
dot(A);
draw(A--A+l*dir(-90),dashed);
draw(Label("$l$",MidPoint,Relative(E)),A--A+l*dir(-90+theta),linewidth(0.8bp));
r = 0.08;
fill(shift(A+l*dir(-90+theta))*scale(r)*unitcircle,black);
r = 0.3;
draw(Label("$\theta$",MidPoint,Relative(E)),arc(A,r,-90,-90+theta));
label("$k$",(l1+ls/2)*dir(0)+d2*dir(90),2*N);
label("$m_1$",A+d2*dir(90),N);
label("$m_2$",A+l*dir(-90+theta),2*E);
tre = D1*dir(-90)--D1*dir(90);
dash = D1*dir(-135);
draw(dashpic,tre,linewidth(1bp));
for(real rp=0;rp<=1;rp=rp+0.012){
P = relpoint(tre,rp);
draw(dashpic,P--P+dash);
}
h = 0.15;
clip(dashpic,box((-h,0),(1,D2)));
add(dashpic);
