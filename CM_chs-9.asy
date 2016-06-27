if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-9";
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
size(350);
//不同阻尼系数下的轨道曲线图
real x,y;
picture g,tmp;
real kappa;
real tra(real x){
return 2*(1+1/kappa)*x+2/kappa/kappa*log(1-kappa*x);
}
real tra0(real x){
return 2*x-x**2;
}
for(y=-2.5;y<1.5;y=y+0.5){
draw(g,(0,y)--(3,y),0.6white);
}
for(x=0.25;x<3;x=x+0.25){
draw(g,(x,-3)--(x,1.5),0.6white);
}
kappa = 0.1;
draw(tmp,graph(tra,0,0.9/kappa),blue+linewidth(1bp));
kappa = 0.5;
draw(tmp,graph(tra,0,0.9/kappa),green+linewidth(1bp));
kappa = 1.0;
draw(tmp,graph(tra,0,0.9678),orange+linewidth(1bp));
kappa = 2.0;
draw(tmp,graph(tra,0,0.499938),red+linewidth(1bp));
draw(tmp,graph(tra0,0,3),linewidth(1bp));
clip(tmp,box((0,-3),(3,1.5)));
add(g,tmp);
erase(tmp);
draw(g,box((0,-3),(3,1.5)),linewidth(1bp));
label(g,"$\dfrac{x}{x_m}$",(3,-3),2.5*E);
label(g,"$\dfrac{y}{y_m}$",(0,1.5),W);
label(g,"$1$",(0,1),W);
label(g,"$0$",(0,0),W);
label(g,"$-1$",(0,-1),W);
label(g,"$-2$",(0,-2),W);
label(g,"$-3$",(0,-3),W);
label(g,"$0.0$",(0,-3),S);
label(g,"$0.5$",(0.5,-3),S);
label(g,"$1.0$",(1,-3),S);
label(g,"$1.5$",(1.5,-3),S);
label(g,"$2.0$",(2,-3),S);
label(g,"$2.5$",(2.5,-3),S);
label(g,"$3.0$",(3,-3),S);
pair A,B;
A = (2.35,-0.3);
B = (2.85,1.3);
real delta;
delta = (B.y-A.y)/10;
fill(g,shift((0.025,-0.05))*box(A,B),black);
unfill(g,box(A,B));
draw(g,box(A,B));
label(g,"$\kappa = 0.0$",((A.x+B.x)/2,A.y)+(0,9*delta));
label(g,"$\kappa = 0.1$",((A.x+B.x)/2,A.y)+(0,7*delta),blue);
label(g,"$\kappa = 0.5$",((A.x+B.x)/2,A.y)+(0,5*delta),green);
label(g,"$\kappa = 1.0$",((A.x+B.x)/2,A.y)+(0,3*delta),orange);
label(g,"$\kappa = 2.0$",((A.x+B.x)/2,A.y)+(0,1*delta),red);
add(xscale(2)*g);
