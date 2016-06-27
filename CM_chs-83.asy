if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-83";
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
//Lagrange陀螺的运动
pair O,r,i,j,k,C;
picture tmp;
O = (0,0);
i = 0.5*dir(-135);
j = dir(0);
k = dir(90);
draw(tmp,Label("$X$",EndPoint,SE,black),O--i,blue,Arrow);
draw(tmp,Label("$Y$",EndPoint,black),O--j,blue,Arrow);
draw(tmp,Label("$Z$",EndPoint,black),O--1.6*k,blue,Arrow);
label(tmp,"$O$",O,SSE);
add(tmp);
erase(tmp);
real f(real x){
return x**2;
}
draw(tmp,graph(f,-1.5,1.5),linewidth(1bp));
draw(tmp,shift((0,f(1.5)))*yscale(1/3)*scale(1.5)*unitcircle,linewidth(1bp));
add(rotate(25)*xscale(0.8)*scale(0.5)*tmp);
erase(tmp);
draw(tmp,Label("$x$",EndPoint,S,black),rotate(25)*(O--i),red,Arrow);
draw(tmp,Label("$y$",EndPoint,black),rotate(25)*(O--j),red,Arrow);
draw(tmp,Label("$z$",EndPoint,W,black),rotate(25)*(O--1.6*k),red,Arrow);
add(tmp);
real r;
r = 0.3;
C = rotate(25)*(0.8*k);
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,r,90,90+25),Arrow);
dot(C);
label("$C$",C,E);
draw(Label("$Mg$",EndPoint,W),C--C+0.8*dir(-90),Arrow);
