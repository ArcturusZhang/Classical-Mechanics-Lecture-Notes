if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-104";
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
size(120);
//m2的速度合成图
pair O;
real theta,v1,v2;
theta = 30;
O = (0,0);
v1 = 1.5;
v2 = 1;
draw(Label("$l\dot{\theta}$",MidPoint,Relative(E)),v2*dir(theta)--O,Arrow);
draw(Label("$\dot{x}$",MidPoint,Relative(E)),O--v1*dir(0),Arrow);
draw(Label("$\boldsymbol{v}_2$",MidPoint,Relative(W)),v2*dir(theta)--v1*dir(0),Arrow);
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,0.2,0,theta));
