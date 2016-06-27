if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-45";
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
//距离反比势场势能曲线图
real alpha,beta,xmax,ymax;
picture tmp;
real fr(real r){
return beta/(r**2)+alpha/r;
}
real f1r(real r){
return beta/(r**2);
}
real f2r(real r){
return alpha/r;
}
alpha = -2.5*4;
beta = 2*4;
ymax = abs(fr(0.53));
draw(tmp,graph(fr,0.3,18,operator..),linewidth(1bp)+red,Label("引力等效势"));
draw(tmp,graph(f2r,0.3,18,operator..),dashed+red,Label("引力势"));
alpha = 2.5*4;
draw(tmp,graph(fr,0.3,18,operator..),linewidth(1bp)+blue,Label("斥力等效势"));
draw(tmp,graph(f2r,0.3,18,operator..),dashed+blue,Label("斥力势"));
draw(tmp,graph(f1r,0.3,18,operator..),dashed,Label("离心势"));
xequals(tmp,0,black);
yequals(tmp,0,black);
path clp;
xmax = 15;
clp = box((-0.1,-2/3*ymax),(xmax,ymax));
clip(tmp,clp);
add(tmp);
label("$r$",(xmax,0),E);
label("$U$",(0,ymax),W);
fill(box((xmax+0.1,ymax-0.2),(xmax-7.4,ymax-5.8)),black);
add(legend(),(xmax,ymax),SW,UnFill);
//draw((0,0)--(xmax+0.9,0),invisible);
