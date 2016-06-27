if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-37";
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
//均匀介质中单色波的波面和光线
pair A,B,h;
A = (0,0);
B = (2,0);
h = 0.25*dir(90);
draw(A--B,Arrow);
draw(shift(h)*(A--B),Arrow);
draw(shift(2*h)*(A--B),Arrow);
draw(Label("$t_0$",BeginPoint,black),interp(A,B,0.15)-0.5*h--interp(A,B,0.15)+2.5*h,red+dashed);
draw(Label("$t$",BeginPoint,black),interp(A,B,0.5)-0.5*h--interp(A,B,0.5)+2.5*h,red+dashed);
draw(Label("$t'$",BeginPoint,black),interp(A,B,0.85)-0.5*h--interp(A,B,0.85)+2.5*h,red+dashed);
dot(interp(A,B,0.5)+h);
draw(Label("$\boldsymbol{k}$",EndPoint,Relative(E)),interp(A,B,0.5)+h--interp(A,B,0.5)+h+0.4*dir(0),Arrow);
