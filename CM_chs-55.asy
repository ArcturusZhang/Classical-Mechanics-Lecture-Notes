if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-55";
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
size(190);
//单摆
pair O;
real theta,l,r;
O = (0,0);
l = 1;
theta = 30;
draw(O--0.6*l*dir(-90),dashed);
draw(Label("$l$",MidPoint,Relative(W)),O--l*dir(theta-90));
r = 0.03;
fill(shift(l*dir(theta-90))*scale(r)*unitcircle,black);
label("$m$",l*dir(theta-90),2*W);
r = 0.1;
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,r,-90,theta-90),Arrow);
draw(0.4*l*dir(180)--0.4*l*dir(0));
int imax;
pair dash,pace,P;
imax = 20;
dash = 0.04*l*dir(60);
pace = (0.8*l/imax,0);
P = 0.4*l*dir(180)+0.2*pace;
for(int i=1;i<=imax;i=i+1){
draw(P--P+dash);
P = P+pace;
}
draw(O--(0,0.01),invisible);
