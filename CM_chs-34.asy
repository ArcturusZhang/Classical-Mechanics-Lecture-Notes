if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-34";
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
size(250);
//二维椭圆坐标系
picture tmp;
real xi,eta,sigma,xmax,ymax;
sigma = 1;
xmax = 2.5;
ymax = 2.5;
pair coor_ell(real theta){
return (sigma*sqrt(xi^2-1)*cos(theta),sigma*xi*sin(theta));
}
pair coor_hyp(real theta){
return (sigma*sqrt(1-eta^2)*sinh(theta),sigma*eta*cosh(theta));
}
for(xi=1;xi<=2.2;xi=xi+0.15){
draw(tmp,graph(coor_ell,0,2*pi),red);
}
for(eta=0;eta<1;eta=eta+0.15){
if (eta==0) continue;
draw(tmp,graph(coor_hyp,-10,10),blue);
}
for(eta=0;eta>-1;eta=eta-0.15){
if (eta==0) continue;
draw(tmp,graph(coor_hyp,-10,10),blue);
}
clip(tmp,box((-xmax,-ymax),(xmax,ymax)));
add(tmp);
draw(Label("$x$",EndPoint),(-xmax,0)--(xmax,0),Arrow);
draw(Label("$z$",EndPoint),(0,-ymax)--(0,ymax),Arrow);
dot("$A_1$",(0,sigma),E);
dot("$A_2$",(0,-sigma),E);
