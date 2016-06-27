if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-131";
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
//215页32.31
picture dashpic,tmp;
pair O,A,B,P,dash;
real alpha,l,lspring,lstart,d1,d2,r0,d,h,ldash;
int nmax;
path pdash;
guide spring,springunit;
//画阴影
ldash = 10;
pdash = ldash*dir(180)--ldash*dir(0);
dash = ldash*dir(-135);
draw(dashpic,pdash,linewidth(1bp));
for(real r=0;r<=1;r=r+0.004){
P = relpoint(pdash,r);
draw(dashpic,P--P+dash);
}
//画弹簧
d = 0.2;
h = 0.1;
nmax = 12;
spring = O--(d/2,h/2);
springunit = (d/2,-3*h/2)--(-d/2,-h/2)--(d/2,h/2);
for(int i=1;i<nmax;i=i+1){
spring = spring--shift(2*i*h*dir(90))*springunit;
}
spring = spring--(-d/2,nmax*2*h-h/2)--(0,nmax*2*h);
//画小车和链接的弹簧
O = (0,0);
alpha = 35;
l = 3;
lstart = 0.2*l;
lspring = 0.7*l;
d1 = 0.8;
d2 = 0.3;
A = d1*dir(0);
B = l*dir(180-alpha);
draw(box(A-(d1,d2),A+(d1,d2)),linewidth(1bp));
spring = O--shift(lstart*dir(180-alpha))*rotate(90-alpha)*scale(lspring/(nmax*2*h))*spring--B;
draw(spring,linewidth(1bp));
label("$A$",A);
add(tmp,dashpic);
h = 0.1;
d = 0.25;
clip(tmp,box((-d,-h),(d,1)));
add(shift(B)*rotate(90-alpha)*yscale(-1)*tmp);
erase(tmp);
draw(O--l*dir(180),dashed);
draw(Label("$\alpha$",MidPoint,Relative(W)),arc(O,0.6*lstart,180,180-alpha),Arrow);
label("$B$",B,2*ENE);
r0 = 0.07;
draw(shift(A+(-d1/2,-d2-r0))*scale(r0)*unitcircle,linewidth(1bp));
draw(shift(A+(d1/2,-d2-r0))*scale(r0)*unitcircle,linewidth(1bp));
add(tmp,dashpic);
d = 1.4*d1;
clip(tmp,box((-d,-h),(d,1)));
add(shift(A+(0,-d2-2*r0))*tmp);
erase(tmp);
draw(Label("$h$",MidPoint,Relative(W)),(B.x,0)--B,dashed);
label("$O$",(B.x,0),S);
