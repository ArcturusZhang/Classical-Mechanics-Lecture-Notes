if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-42";
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
//n>2的情形
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
n = 3;
draw(tmp,xscale(0.8)*graph(fr,0.3,18,operator..),linewidth(1bp));
draw(tmp,xscale(0.8)*graph(f1r,0.3,18,operator..),dashed);
draw(tmp,xscale(0.8)*graph(f2r,0.3,18,operator..),dashed);
xequals(tmp,0,black);
yequals(tmp,0,black);
real rm,r1,r2,r3,E3;
rm = (2*beta/alpha/n)**(1/(2-n));
draw(tmp,xscale(0.8)*((0,fr(rm))--(rm,fr(rm))--(rm,0)),red);
r1 = (beta/alpha)**(1/(2-n))+0.069;
r2 = 2.5;
draw(tmp,xscale(0.8)*((0,fr(r2))--(18,fr(r2))),green);
draw(tmp,xscale(0.8)*((r2,fr(r2))--(r2,0)),green);
draw(tmp,xscale(0.8)*((r1,0)--(r1,fr(r1))),green);
r3 = 0.7;
draw(tmp,xscale(0.8)*((0,fr(r3))--(r3,fr(r3))--(r3,0)),orange);
E3 = 1.8;
draw(tmp,xscale(0.8)*((0,E3)--(18,E3)),blue);
path clp;
clp = box((-0.1,-fr(0.6)),(7.2,fr(0.6)));
clip(tmp,clp);
add(tmp);
label("$\dfrac{l^2}{2\mu r^2}$",xscale(0.8)*(1.3,f1r(1.3)),NE);
label("$V$",xscale(0.8)*(1.3,f2r(1.3)),SE);
label("$E_0$",(0,fr(rm)),W,red);
label("$E_1$",(0,fr(r2)),W,green);
label("$E_2$",(0,0),W);
label("$E_3$",(0,E3),W,blue);
label("$E_4$",(0,fr(r3)),W,orange);
label("$r$",(7.2,0),E);
label("$U$",(0,abs(fr(0.6))),W);
//draw((0,0)--(7.9,0),invisible);
