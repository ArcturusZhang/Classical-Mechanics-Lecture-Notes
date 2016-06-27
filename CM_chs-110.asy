if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-110";
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
//37页4.57
pair A,B,D,C1,C2;
real r1,r2,l1,l2,l,alpha,theta,r;
A = (0,0);
l = 2;
theta = -130;
alpha = 50;
C1 = l*dir(theta+alpha);
C2 = l*dir(theta);
r2 = 0.7;
r1 = 2*l*Sin(alpha/2)-r2;
l1 = l-r1;
l2 = l-r2;
draw(A--l1*dir(theta+alpha));

draw(A--l2*dir(theta));
draw(l1*dir(theta+alpha)--C1--C2--l2*dir(theta),dashed);
draw(shift(C1)*scale(r1)*unitcircle);
draw(shift(C2)*scale(r2)*unitcircle);
draw(Label("$E$",EndPoint),A+0.6*l*dir(180)--A+0.6*l*dir(0),linewidth(0.8bp));
pair P,dash,pace;
int imax;
imax = 30;
dash = 0.1*dir(60);
pace = 2*0.6*l*dir(0)/imax;
P = A+0.6*l*dir(180)+0.2*pace;
for(int i=1;i<=imax;i=i+1){
draw(P--P+dash);
P = P+pace;
}
dot(C1,UnFill);
label("$C_1$",C1,S);
dot(C2,UnFill);
label("$C_2$",C2,S);
label("$A$",A,3*N);
label("$B$",l1*dir(theta+alpha),NW);
label("$D$",l2*dir(theta),2*N);
r = 0.5;
draw(Label("$\alpha$",MidPoint,Relative(W)),arc(A,r,theta+alpha,theta),Arrows);
r = 0.25;
draw(Label("$\theta$",Relative(0.4),Relative(W)),arc(A,r,0,theta),Arrows);
