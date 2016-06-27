if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-60";
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
//一维阻尼振动情形2
pair O;
real x0,tmax,xmax,tscale,beta1,beta2,c1,c2;
tmax = 10;
xmax = 13;
beta1 = 0.8;
beta2 = 0.2;
c1 = 1;
c2 = 10;
real decay(real t){
return c1*exp(-beta1*t)+c2*exp(-beta2*t);
}
tscale = 2;
draw(Label("$t$",EndPoint),xscale(tscale)*(O--1.1*tmax*dir(0)),Arrow);
draw(Label("$x$",EndPoint),O--1.1*xmax*dir(90),Arrow);
label("$O$",O,W);
draw(xscale(tscale)*graph(decay,0,tmax));
