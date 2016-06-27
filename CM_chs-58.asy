if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-58";
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
//双摆
pair O;
real theta1,theta2,l,r;
O = (0,0);
l = 0.7;
theta1 = 30;
theta2 = 15;
draw(O--0.6*l*dir(-90),dashed);
draw(Label("$l$",MidPoint,Relative(W)),O--l*dir(theta1-90));
draw(l*dir(theta1-90)--l*dir(theta1-90)+0.6*l*dir(-90),dashed);
draw(Label("$l$",MidPoint,Relative(W)),l*dir(theta1-90)--l*dir(theta1-90)+l*dir(theta2-90));
r = 0.03;
fill(shift(l*dir(theta1-90))*scale(r)*unitcircle,black);
fill(shift(l*dir(theta1-90)+l*dir(theta2-90))*scale(r)*unitcircle,black);
label("$m$",l*dir(theta1-90),2*W);
label("$m$",l*dir(theta1-90)+l*dir(theta2-90),2*W);
r = 0.1;
draw(Label("$\theta_1$",MidPoint,Relative(E)),arc(O,r,-90,theta1-90),Arrow);
r = 0.2;
draw(Label("$\theta_2$",MidPoint,Relative(E)),arc(l*dir(theta1-90),r,-90,theta2-90),Arrow);
draw(0.4*l*dir(180)--0.4*l*dir(0));
int imax;
pair dash,pace,P;
imax = 15;
dash = 0.06*l*dir(60);
pace = (0.8*l/imax,0);
P = 0.4*l*dir(180)+0.2*pace;
for(int i=1;i<=imax;i=i+1){
draw(P--P+dash);
P = P+pace;
}
//draw(O--(0.7,0.02),invisible);
