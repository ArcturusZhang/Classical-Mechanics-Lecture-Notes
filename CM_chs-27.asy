if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-27";
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
//第二章例5势能曲线
real Rg,scale;
real f(real theta){
return scale*(-0.5*Rg*(sin(theta))**2+1-cos(theta));
}
scale = 2.5;
Rg = 0;
draw(Label("$\theta$",EndPoint),(-3.5,0)--(3.5,0),Arrow);
draw(Label("$V'$",EndPoint),(0,-0.5)--(0,f(pi)+0.4),Arrow);
pair P;
for(int i=1;i<=4;i=i+1){
P = (0,f(pi)/4*i);
draw((P-(0.1,0))--(P+(0.1,0)));
}
label("$mgR$",(0.1,f(pi)/2),E);
draw(Label("$-\pi$",BeginPoint),(-pi,-0.1)--(-pi,0.1));
draw(Label("$\pi$",BeginPoint),(pi,-0.1)--(pi,0.1));
draw(graph(f,-pi,pi),linewidth(0.8bp));
Rg = 0.5;
draw(graph(f,-pi,pi),red+linewidth(0.8bp));
Rg = 1;
draw(graph(f,-pi,pi),yellow+linewidth(0.8bp));
Rg = 2;
draw(graph(f,-pi,pi),green+linewidth(0.8bp));

pair A,B;
A = (-3,0.4*f(pi));
B = (-1,0.85*f(pi));
real delta;
delta = (B.y-A.y)/8;
fill(shift((0.05,-0.05))*box(A,B),black);
unfill(box(A,B));
draw(box(A,B));
label("$R\mathnormal{\Omega}^2/g = 0.0$",((A.x+B.x)/2,A.y)+(0,7*delta));
label("$R\mathnormal{\Omega}^2/g = 0.5$",((A.x+B.x)/2,A.y)+(0,5*delta),red);
label("$R\mathnormal{\Omega}^2/g = 1.0$",((A.x+B.x)/2,A.y)+(0,3*delta),yellow);
label("$R\mathnormal{\Omega}^2/g = 2.0$",((A.x+B.x)/2,A.y)+(0,1*delta),green);
