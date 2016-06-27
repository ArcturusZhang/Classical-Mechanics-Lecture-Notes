if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-100";
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
//理论力学：32页1.37
picture dashpic;
pair O,A,B,dash,P;
real d1,d2,H,I,ldash;
path pdash;
guide spring(real d,real h,int nmax){
guide temp,springunit;
temp = O--(d/2,h/2);
springunit = (d/2,-3*h/2)--(-d/2,-h/2)--(d/2,h/2);
for(int i=1;i<nmax;i=i+1){
temp = temp--shift(2*i*h*dir(90))*springunit;
}
temp = temp--(-d/2,nmax*2*h-h/2)--(0,nmax*2*h);
return temp;
}
O = (0,0);
d1 = 1;
d2 = 0.5;
B = (0,d2);
draw(shift(B)*box((-d1,-d2),(d1,d2)),linewidth(0.8bp));
H = 2.5;
A = (0,H+3*d2);
draw(shift(A)*box((-d1,-d2),(d1,d2)),linewidth(0.8bp));
draw(Label("$k$",MidPoint,2*E),shift(B+d2*dir(90)+0.5*d1*dir(0))*spring(0.1,H/20,10));
draw(Label("$k$",MidPoint,2*W),shift(B+d2*dir(90)-0.5*d1*dir(0))*spring(0.1,H/20,10));
label("$A$",A);
label("$B$",B);
I = 1;
draw(Label("$I$",BeginPoint),A+(0,I+d2)--A+(0,d2),Arrow);
ldash = 10;
pdash = ldash*dir(180)--ldash*dir(0);
dash = ldash*dir(-135);
draw(dashpic,pdash,linewidth(1bp));
for(real r=0;r<=1;r=r+0.01){
P = relpoint(pdash,r);
draw(dashpic,P--P+dash);
}
clip(dashpic,box((-2*d1,-0.2),(2*d1,1)));
add(shift(B+d2*dir(-90))*dashpic);
