if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-44";
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
//n=2的情形2
real alpha,beta,n;
picture tmp;
real fr(real r){
return beta/(r**2)-alpha/(r**n);
}
real f1r(real r){
return beta/(r**2);
}
real f2r(real r){
return -alpha/(r**n);
}
alpha = 1*1.7;
beta = 1.6*1.7;
n = 2;
draw(tmp,graph(fr,0.3,18,operator..),linewidth(1bp));
draw(tmp,graph(f1r,0.3,18,operator..),dashed);
draw(tmp,graph(f2r,0.3,18,operator..),dashed);
xequals(tmp,0,black);
yequals(tmp,0,black);
real r1;
r1 = 1;
draw(tmp,(r1,0)--(r1,fr(r1))--(0,fr(r1)),green);
path clp;
clp = box((-0.1,-fr(0.6)),(6,fr(0.6)));
clip(tmp,clp);
add(tmp);
label("$\dfrac{l^2}{2\mu r^2}$",(1.2,f1r(1.2)),NE);
label("$V$",(1.3,f2r(1.3)),SE);
label("$E_1$",(0,fr(r1)),W,green);
label("$E_2$",(0,0),W);
label("$r$",(6,0),E);
label("$U$",(0,abs(fr(0.6))),W);
//draw((0,0)--(6.9,0),invisible);
