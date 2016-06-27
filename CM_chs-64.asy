if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-64";
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
//坐标系的定点旋转
pair O,i,j,k;
O = (0,0);
i = 0.5*dir(-135);
j = dir(0);
k = dir(90);
pair xyz(triple coff){
real x,y,z,r,theta,phi;
r = coff.x;
theta = coff.y;
phi = coff.z;
x = r*sin(theta)*cos(phi);
y = r*sin(theta)*sin(phi);
z = r*cos(theta);
return x*i+y*j+z*k;
}
pair t2t(triple xyz){
return xyz.x*i+xyz.y*j+xyz.z*k;
}
draw(Label("$X_1$",EndPoint,S),O--i,Arrow);
draw(Label("$X_2$",EndPoint),O--j,Arrow);
draw(Label("$X_3$",EndPoint),O--k,Arrow);
label("$O$",O,SSE);
//dot(xyz((1,pi/4,pi/3)),red);
draw(Label("$\boldsymbol{R}$",MidPoint,Relative(E),black),O--xyz((1,pi/4,pi/3)),red,Arrow);
draw(Label("$x_3$",EndPoint,black),O--xyz((1,pi/6,pi/3)),blue,Arrow);
draw(Label("$x_2$",EndPoint,black),O--xyz((1,pi/6+pi/2,pi/3)),blue,Arrow);
draw(Label("$x_1$",EndPoint,black),O--xyz((1,pi/2,pi/3-pi/2)),blue,Arrow);
//draw(O--(1.15,0),invisible);
