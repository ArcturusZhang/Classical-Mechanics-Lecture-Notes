if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-81";
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
//
pair O,i,j,k;
real a,b,c,L;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
a = 3;
b = 2;
c = 1;
pair ell1(real t){
return a*cos(t)*i+b*sin(t)*j;
}
pair ell2(real t){
return b*cos(t)*j+c*sin(t)*k;
}
pair ell3(real t){
return c*cos(t)*k+a*sin(t)*i;
}
real la,lb,theta;
la = 2.175;
lb = 1.315;
theta = 10.5;
draw(rotate(theta)*xscale(la)*yscale(lb)*unitcircle,linewidth(0.8bp));
real tmp1,tmp2;
tmp1 = -1.15;
draw(graph(ell1,tmp1,tmp1+pi),linewidth(0.5bp));
draw(graph(ell1,tmp1+pi,tmp1+2*pi),dashed);
tmp1 = -0.5;
draw(graph(ell2,tmp1,tmp1+pi),linewidth(0.5bp));
draw(graph(ell2,tmp1+pi,tmp1+2*pi),dashed);
tmp1 = -0.9;
draw(graph(ell3,tmp1,tmp1+pi),linewidth(0.5bp));
draw(graph(ell3,tmp1+pi,tmp1+2*pi),dashed);
pair ell_cur1(real t){
real x,y,z;
x = a*cos(t)/sqrt((a^2-c^2)/(L^2-c^2));
y = b*sin(t)/sqrt((b^2-c^2)/(L^2-c^2));
z = sqrt(L^2-x^2-y^2);
return x*i+y*j+z*k;
}
pair ell_cur2(real t){
real x,y,z;
x = a*cos(t)/sqrt((a^2-c^2)/(L^2-c^2));
y = b*sin(t)/sqrt((b^2-c^2)/(L^2-c^2));
z = -sqrt(L^2-x^2-y^2);
return x*i+y*j+z*k;
}
L = 1.2;
draw(graph(ell_cur1,0,2*pi),linewidth(0.8bp)+red);
draw(graph(ell_cur2,0,2*pi),dashed+red);
L = 1.5;
draw(graph(ell_cur1,0,2*pi),linewidth(0.8bp)+0.7red+0.3blue);
draw(graph(ell_cur2,0,2*pi),dashed+0.7red+0.3blue);
L = 1.8;
draw(graph(ell_cur1,0,2*pi),linewidth(0.8bp)+0.3red+0.7blue);
draw(graph(ell_cur2,0,2*pi),dashed+0.3red+0.7blue);
L = 2;
tmp1 = -1.15;
tmp2 = 2*pi-2.8;
draw(graph(ell_cur1,tmp1,tmp2),linewidth(0.8bp)+blue);
draw(graph(ell_cur1,tmp2,2*pi+tmp1),dashed+blue);
draw(graph(ell_cur2,pi+tmp1,pi+tmp2),dashed+blue);
draw(graph(ell_cur2,pi+tmp2,3*pi+tmp1),linewidth(0.8bp)+blue);
pair ell_cur3(real t){
real x,y,z;
y = b*cos(t)/sqrt((a^2-b^2)/(a^2-L^2));
z = c*sin(t)/sqrt((a^2-c^2)/(a^2-L^2));
x = sqrt(L^2-y^2-z^2);
return x*i+y*j+z*k;
}
pair ell_cur4(real t){
real x,y,z;
y = b*cos(t)/sqrt((a^2-b^2)/(a^2-L^2));
z = c*sin(t)/sqrt((a^2-c^2)/(a^2-L^2));
x = -sqrt(L^2-y^2-z^2);
return x*i+y*j+z*k;
}
L = 2.2;
draw(graph(ell_cur3,0,2*pi),linewidth(0.8bp)+0.8blue+0.2green);
draw(graph(ell_cur4,0,2*pi),dashed+0.8blue+0.2green);
L = 2.5;
draw(graph(ell_cur3,0,2*pi),linewidth(0.8bp)+0.5blue+0.5green);
draw(graph(ell_cur4,0,2*pi),dashed+0.5blue+0.5green);
L = 2.8;
draw(graph(ell_cur3,0,2*pi),linewidth(0.8bp)+green);
draw(graph(ell_cur4,0,2*pi),dashed+green);
// draw(O--a*i,dashed);
// draw(O--b*j,dashed);
// draw(O--c*k,dashed);
draw(Label("$x_3$",EndPoint),a*i--(a+2)*i,Arrow);
draw(Label("$x_2$",EndPoint),b*j--(b+0.6)*j,Arrow);
draw(Label("$x_1$",EndPoint),c*k--(c+1)*k,Arrow);
