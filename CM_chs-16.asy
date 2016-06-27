if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-16";
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
size(200);
//单摆的几何约束
pair O,x,y,r;
O = (0,0);
x = (4,0);
y = (0,-4.5);
r = (3,-4);
draw(Label("$x$",EndPoint),O--x,Arrow);
draw(Label("$y$",EndPoint),O--y,Arrow);
label("$O$",O,W);
filldraw(shift(r)*scale(0.2)*unitcircle,yellow,black);
draw(Label("$\boldsymbol{r}$",MidPoint,Relative(E)),O--r,Arrow);
draw(Label("$l$",MidPoint,Relative(W)),O--r,Arrow);
//draw(O--(4.5,0),invisible);
