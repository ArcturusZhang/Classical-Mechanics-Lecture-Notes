if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-73";
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
//惯量椭球和主轴系
pair O,i,j,k;
picture tmp,clp1,clp2;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
label("$O$",O,W);

real a,b,alpha,beta;
a = 3;
b = 5;

pair ell1(real t){
real x,y,z;
x = a*cos(t)*cos(alpha);
y = b*sin(t);
z = a*cos(t)*sin(alpha);
return x*i+y*j+z*k;
}
pair ell2(real t){
real x,y,z;
x = a*cos(t);
y = 0;
z = a*sin(t);
return x*i+y*j+z*k;
}
alpha = 0;
beta = 20;
draw(tmp,Label(rotate(-beta)*"$x'$",EndPoint,black),O--4.5*i,red,Arrow);
draw(tmp,Label(rotate(-beta)*"$y'$",EndPoint,black),O--6*j,red,Arrow);
draw(tmp,Label(rotate(-beta)*"$z'$",EndPoint,black),O--4.5*k,red,Arrow);
path cir1,cir2;
cir1 = graph(ell1,0,2*pi)--cycle;
cir2 = graph(ell2,0,2*pi)--cycle;
unfill(tmp,cir1);
unfill(tmp,cir2);
draw(clp1,Label(rotate(-beta)*"$x'$",EndPoint,black),O--4.5*i,red+dashed,Arrow);
draw(clp1,Label(rotate(-beta)*"$y'$",EndPoint,black),O--6*j,red+dashed,Arrow);
draw(clp1,Label(rotate(-beta)*"$z'$",EndPoint,black),O--4.5*k,red+dashed,Arrow);
add(clp2,clp1);
clip(clp1,cir1);
clip(clp2,cir2);
add(tmp,clp1);
add(tmp,clp2);
draw(tmp,cir1,dashed);
draw(tmp,cir2,dashed);
draw(tmp,xscale(0.97*b)*yscale(a)*unitcircle);
add(rotate(beta)*tmp);
erase(tmp);

draw(Label("$x$",EndPoint,black),O--6*i,blue,Arrow);
draw(Label("$y$",EndPoint,black),O--6*j,blue,Arrow);
draw(Label("$z$",EndPoint,black),O--4.5*k,blue,Arrow);
