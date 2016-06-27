if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-11";
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
//第一章例6求解示意
pair O;
real x,y,xm,ym;
O = (0,0);
xm = 0.8;
ym = 0.8;
//画坐标系
draw(Label("$\mu$",EndPoint),O--(xm,0));
draw(Label("$f(\mu)$",EndPoint),O--(0,ym));
label("$0.0$",O,S);
label("$0.0$",O,W);
for(x = 0.1;x < xm-0.1;x = x+0.1){
draw((x,0)--(x,0.01));
}
label("$0.5$",(0.5,0),S);
for(y = 0.1;y < ym-0.1;y = y+0.1){
draw((0,y)--(0.01,y));
}
label("$0.5$",(0,0.5),W);

real lin(real mu){
return mu;
}
real fmu(real mu){
return sqrt((1-3*mu*exp(-mu*pi))/2);
}
draw(graph(lin,0,xm),linewidth(0.8bp));
draw(Label("$f(\mu)$",EndPoint),graph(fmu,0,xm),red+linewidth(0.8bp));
draw(O--(0,fmu(0))--(fmu(0),fmu(0))--(fmu(0),fmu(fmu(0)))--(fmu(fmu(0)),fmu(fmu(0)))--(fmu(fmu(0)),fmu(fmu(fmu(0))))--(fmu(fmu(fmu(0))),fmu(fmu(fmu(0)))),blue+linewidth(0.8bp));
label("$0.707\cdots$",(fmu(0),fmu(0)),E);
label("$0.620\cdots$",(fmu(fmu(0)),fmu(fmu(0))),NW);
label("$0.606\cdots$",(fmu(fmu(fmu(0))),fmu(fmu(fmu(0)))),W);
real m;
m = 0;
for(int i=1;i<10;++i){
m = fmu(m);
}
dot((m,m));
label("$0.603\cdots$",(m,m),SE);
//draw((0,0)--(xm+0.2,0),invisible);
