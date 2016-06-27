if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-51";
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
size(350);
//弹性散射的几何参数
real p,e,theta0,b,l;
picture tmp;
real fr(real theta){
return p/(e*cos(theta)-1);
}
pair xy(real theta){
return (fr(theta)*cos(theta),fr(theta)*sin(theta));
}
p = 1;
e = 2;
theta0 = acos(1/e);
b = p/(e*sqrt(e*e-1));
l = 10;
draw(tmp,rotate(180-theta0/pi*180)*graph(xy,-0.32*pi,0.32*pi),red+linewidth(1bp));
draw(tmp,rotate(180-theta0/pi*180)*((p/(e*e-1),0)--(p/(e*e-1),0)+l*dir(theta0/pi*180)),dashed);
draw(tmp,rotate(180-theta0/pi*180)*((p/(e*e-1),0)--(p/(e*e-1),0)+l*dir(-theta0/pi*180)),dashed);
draw(tmp,rotate(180-theta0/pi*180)*((0,0)--p/(e-1)*dir(0)),dashed);
draw(tmp,rotate(180-theta0/pi*180)*(l*dir(theta0/pi*180)--(0,0)--l*dir(-theta0/pi*180)),dashed);
dot(tmp,(0,0));
label("$\phi$",rotate(180-theta0/pi*180)*(p/(e*e-1),0),dir(180-theta0/2/pi*180));
label("$\phi$",rotate(180-theta0/pi*180)*(p/(e*e-1),0),dir(180-theta0*3/2/pi*180));
path clp;
clp = (0,0)--l*dir(theta0/pi*180)--l*dir(theta0/pi*180)+2*b*dir(theta0/pi*180-90)--l*dir(0)--l*dir(-theta0/pi*180)+2*b*dir(-theta0/pi*180+90)--l*dir(-theta0/pi*180)--cycle;
clp = rotate(180-theta0/pi*180)*shift((-0.1,0))*clp;
clip(tmp,clp);
draw(tmp,(0,0)--(0.5*l,0),dashed);
label(tmp,"$\theta$",(0,0),2*dir((180-2*theta0/pi*180)/2));
draw(tmp,Label("$r_{\mathrm{min}}$",BeginPoint,Relative(W)),rotate(180-theta0/pi*180)*(p/(e-1)*dir(0)+dir(0)--p/(e-1)*dir(0)),Arrow);
draw(tmp,rotate(180-theta0/pi*180)*(-dir(0)--(0,0)),Arrow);
draw(tmp,0.9*l*dir(180)-dir(90)--(0.9*l*dir(180)),Arrow);
draw(tmp,Label("$b$",BeginPoint,Relative(W)),0.9*l*dir(180)+b*dir(90)+dir(90)--(0.9*l*dir(180)+b*dir(90)),Arrow);
draw(tmp,Label("$\boldsymbol{v}_i$",MidPoint,Relative(E)),shift((0,b))*(l*dir(180)+dir(180)--l*dir(180)),Arrow);
draw(tmp,Label("$\boldsymbol{v}_f$",MidPoint,Relative(E)),shift(b*dir(90+180-2*theta0/pi*180))*(l*dir(180-2*theta0/pi*180)--l*dir(180-2*theta0/pi*180)+dir(180-2*theta0/pi*180)),Arrow);
label(tmp,"$O$",(0,0),SW);
add(tmp);
//draw((0,0)--(0.5*l+1.2,0),invisible);
