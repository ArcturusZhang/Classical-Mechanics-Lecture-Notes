if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-59";
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
//一维阻尼振动情形1
pair O;
real tscale,tmax,xmax,omega0,beta,x0,v0,omega,phi,a;
tmax = 10;
xmax = 15;
omega0 = 2;
beta = 0.2;
x0 = 4;
v0 = 10;
omega = sqrt(omega0**2-beta**2);
phi = atan(v0/(x0*omega)+beta/omega);
a = x0+x0*(v0/(x0*omega)+beta/omega)**2;
real vibrate(real t){
return a*exp(-beta*t)*cos(omega*t-phi);
}
real decay(real t){
return a*exp(-beta*t);
}
tscale = 3;
draw(Label("$t$",EndPoint),xscale(tscale)*(O--1.1*tmax*dir(0)),Arrow);
draw(Label("$x$",EndPoint),1.1*xmax*dir(-90)--1.1*xmax*dir(90),Arrow);
label("$O$",O,W);
draw(xscale(tscale)*graph(vibrate,0,tmax));
draw(Label("$\phantom{-}a\mathrm{e}^{-\beta t}$",MidPoint,Relative(W)),xscale(tscale)*graph(decay,0,tmax),dashed);
draw(Label("$-a\mathrm{e}^{-\beta t}$",MidPoint,Relative(E)),yscale(-1)*xscale(tscale)*graph(decay,0,tmax),dashed);
