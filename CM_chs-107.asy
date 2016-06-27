if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-107";
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
//37页4.56
pair O,A,B,C1,C2;
real r1,r2,l1,l,alpha,beta,delta;
O = (0,0);
l = 2;
A = l*dir(30+90);
B = l*dir(30);
draw(Label("$A$",EndPoint),O--A,linewidth(0.8bp));
draw(Label("$B$",EndPoint),O--B,linewidth(0.8bp));
draw(Label("$x$",EndPoint),O--(B.x,0),dashed);
draw(Label("$x_1$",EndPoint),O--(A.x,0),dashed);
r1 = 0.4;
l1 = 1.2;
alpha = aTan(r1/l1);
C1 = l1*dir(A)+rotate(-90)*r1*dir(A);
draw(shift(C1)*scale(r1)*unitcircle);
beta = 45-alpha;
r2 = l1*Tan(beta);
C2 = l1*dir(B)+rotate(90)*r2*dir(B);
draw(shift(C2)*scale(r2)*unitcircle);
pair CC1,CC2,CCt;
CC1 = interp(C1,C2,-0.2);
CC2 = interp(C1,C2,1.8);
CCt = CC2+(2*r1+r2)*dir(180);
draw(CC1--CC2--CCt,dashed);
delta = 10;
draw(Label("$\phi$",MidPoint,Relative(E)),arc(CC2,r1+r2,degrees(CC1-CC2)-delta,degrees(CC1-CC2)),Arrow);
draw(arc(CC2,r1+r2,180+delta,180),Arrow);
pair P,dash,pace;
int imax;
imax = 30;
dash = 0.1*dir(-110);
pace = (B-O)/imax;
P = O;
for(int i=1;i<=imax+1;i=i+1){
draw(P--P+dash);
P = P+pace;
}
pace = (A-O)/imax;
P = O;
for(int i=2;i<=imax+1;i=i+1){
draw(P--P+dash);
P = P+pace;
}
dot(C1,UnFill);
label("$C_1$",C1,N);
dot(C2,UnFill);
label("$C_2$",C2,N);
draw(Label("$\ang{30}$",MidPoint,Relative(E)),arc(O,0.5,0,degrees(B)),Arrows);
draw(Label("$\ang{60}$",MidPoint,Relative(W)),arc(O,0.5,180,degrees(A)),Arrows);
