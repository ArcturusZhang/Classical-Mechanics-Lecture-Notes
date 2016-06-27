if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-56";
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
//单摆
pair O;
real mgl;
picture tmp;
real V1(real theta){
return 0.5*mgl*theta**2;
}
real V2(real theta){
return mgl*(1-cos(theta));
}
O = (0,0);
mgl = 3;
draw(tmp,graph(V1,-pi,pi),dashed);
draw(tmp,graph(V2,-pi,pi),red);
path clp;
clp = box((-pi,0),(pi,2*mgl));
clip(tmp,clp);
add(tmp);
draw(Label("$\theta$",EndPoint),(-3.5,0)--(3.5,0));
draw(Label("$V$",EndPoint),(0,0)--(0,2.2*mgl));
draw(Label("$-\pi$",BeginPoint),(-pi,0)--(-pi,0.1));
draw(Label("$\pi$",BeginPoint),(pi,0)--(pi,0.1));
draw(Label("$mgl$",EndPoint),(-0.1,mgl)--(0.1,mgl));
draw((-0.1,2*mgl)--(0.1,2*mgl));
//draw(O--(4.3,0),invisible);
