if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-29";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("siunitx");
import graph;
import math;
size(300);
//最速降线
pair O,P;
real x,y,rp;
path p;
O = (0,0);
x = 7.4;
y = 2.5;
draw(Label("$x$",EndPoint),0.1*x*dir(180)--x*dir(0),Arrow);
draw(Label("$y$",EndPoint),0.2*y*dir(90)--y*dir(-90),Arrow);
label("$O$",O,SW);
pair cycloid(real t){
return (t-sin(t),cos(t)-1);
}
rp = 0.7*2*pi;
p = graph(cycloid,0,rp);
draw(p,red+linewidth(1bp));
label("$A$",O,NW);
P = cycloid(rp);
label("$B$",P,SE);
p = graph(cycloid,rp,2*pi);
draw(p);
dot(O);
dot(P);
