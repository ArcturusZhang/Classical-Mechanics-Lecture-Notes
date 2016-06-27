if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-41";
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
//0<n<2的情形
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
alpha = 0.8*4;
beta = 1*4;
n = 1;
draw(tmp,xscale(0.4)*graph(fr,0.3,18,operator..),linewidth(1bp));
draw(tmp,xscale(0.4)*graph(f1r,0.3,18,operator..),dashed);
draw(tmp,xscale(0.4)*graph(f2r,0.3,18,operator..),dashed);
xequals(tmp,0,black);
yequals(tmp,0,black);
real rm,r1,r2;
rm = (2*beta/alpha/n)**(1/(2-n));
draw(tmp,xscale(0.4)*((0,fr(rm))--(rm,fr(rm))--(rm,0)),red);
r1 = (beta/alpha)**(1/(2-n))+0.225;
r2 = 8;
draw(tmp,xscale(0.4)*((0,fr(r2))--(r2,fr(r2))--(r2,0)),green);
draw(tmp,xscale(0.4)*((r1,0)--(r1,fr(r1))),green);
draw(tmp,xscale(0.4)*((0,fr(1))--(18,fr(1))),blue);
draw(tmp,xscale(0.4)*((1,fr(1))--(1,0)),blue);
path clp;
clp = box((-0.1,-fr(0.7)),(7.2,fr(0.7)));
clip(tmp,clp);
add(tmp);
label("$\dfrac{l^2}{2\mu r^2}$",xscale(0.4)*(2,f1r(2)),NE);
label("$V$",xscale(0.4)*(2,f2r(2)),SE);
label("$E_0$",(0,fr(rm)),SW,red);
label("$E_1$",(0,fr(r2)),W,green);
label("$E_2$",(0,0),NW);
label("$E_3$",(0,fr(1)),W,blue);
label("$r$",(7.2,0),E);
label("$U$",(0,fr(0.7)),W);
