if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-85";
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
size(150);
//Lagrange陀螺进动1
pair i,j,k;
real r,theta0,thetam,w,theta;
r = 1;
theta0 = pi/4;
thetam = pi/10;
w = 9;
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
pair spconvert(real r,real theta,real phi){
return r*sin(theta)*cos(phi)*i+r*sin(theta)*sin(phi)*j+r*cos(theta)*k;
}
pair thetaphi(real phi){
return spconvert(r,theta0-thetam*sin(w*r*sin(theta0)*phi),phi);
}
pair phicir(real phi){
return spconvert(r,theta,phi);
}
draw(Label("$Z$",EndPoint),r*k--1.4*r*k,Arrow);
theta = theta0-thetam;
draw(graph(phicir,-1.8,2.57),dashed);
label("$\theta_1$",phicir(2.57),NE);
theta = theta0+thetam;
draw(graph(phicir,-1.4,2.1),dashed);
label("$\theta_2$",phicir(2.1),NE);
draw(graph(thetaphi,-1.4,2.4,200),linewidth(0.8bp)+red);
draw(scale(r)*unitcircle,linewidth(0.8bp));
