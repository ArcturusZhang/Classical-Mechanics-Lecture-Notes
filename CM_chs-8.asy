if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-8";
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
size(300);
//第一章例4图
real R,r,theta,dtheta;
pair O,C,Cp,P,Pp,v0,vt,vtp;
O = (0,0);
R = 2.5;
theta = 110;
dtheta = 15;
dot(O);
label("$\theta$",O,NE);
draw(scale(R)*unitcircle,linewidth(0.8bp));
draw(Label("$R$",MidPoint,W),O--R*dir(90));
r = 0.3*R;
draw(arc(O,r,90-theta-dtheta-25,90-theta-dtheta),Arrow);
draw(Label("$\mathrm{d} \theta$",MidPoint,Relative(W)),arc(O,r,90-theta+25,90-theta),Arrow);

pair jkx(real phi){
return R*dir(90-phi)+R*phi*pi/180*dir(180-phi);
}
pair djkx(real phi){
real phir;
phir = phi*pi/180;
return (sin(phir),cos(phir));
}
draw(graph(jkx,0,150),red+linewidth(0.8bp));
draw(Label("$\boldsymbol{v}_0$",EndPoint),jkx(0)--jkx(0)+djkx(0),Arrow);
dot(jkx(0));
draw(Label("$\boldsymbol{v}$",EndPoint,Relative(W)),jkx(theta)--jkx(theta)+djkx(theta),Arrow);
dot(jkx(theta));
draw(jkx(theta+dtheta)--jkx(theta+dtheta)+djkx(theta+dtheta),Arrow);
dot(jkx(theta+dtheta));
draw(O--R*dir(90-theta));
draw(Label("$R\theta$",MidPoint,Relative(W)),R*dir(90-theta)--jkx(theta));
draw(jkx(theta)--jkx(theta)-dir(180-theta),blue,Arrow);
draw(O--R*dir(90-theta-dtheta)--jkx(theta+dtheta),dashed);
label("$\mathrm{d} s$",jkx(theta+dtheta/2),S);
draw(O--(2.95*R,1.6*R),invisible);
