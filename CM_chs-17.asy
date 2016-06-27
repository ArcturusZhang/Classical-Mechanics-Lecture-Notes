if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-17";
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
size(200);
//纯滚动直立圆盘
real hd,hdd;
pair O,x,y,z,i,j,k;
hd = 131+25/60;
hdd = 7+10/60;
O = (0,0);
x = 1.2*dir(90+hd);
y = 1.5*dir(-hdd);
z = 1.5*dir(90);
draw(Label("$x$",EndPoint),O--x,Arrow);
draw(Label("$y$",EndPoint),O--y,Arrow);
draw(Label("$z$",EndPoint),O--z,Arrow);
label("$O$",O,NW);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);

real x0,y0,r,phi;
pair P;
pair planecur(real xx){
real yy = y0+1*tan(xx-x0);
return xx*i+yy*j;
}
pair dplanecur(real xx){
real yy = 1/((cos(xx-x0))**2);
return xx*i+yy*j;
}
pair wheel(real theta){
real xx,yy,zz;
xx = x0+r*sin(theta)*cos(phi);
yy = y0+r*sin(theta)*sin(phi);
zz = r+r*cos(theta);
return xx*i+yy*j+zz*k;
}
real getphi(real xx){
real yy = 1/((cos(xx-x0))**2);
return atan(yy/xx);
}
x0 = 1;
y0 = 0.7;
r = 0.5;
phi = getphi(x0);
unfill(graph(wheel,0,2*pi)--cycle);
draw(graph(wheel,0,2*pi),linewidth(0.8bp));
draw(graph(planecur,x0-1,x0+1));
P = planecur(x0);
dot(P);
draw((P-0.7*dplanecur(x0))--(P+dplanecur(x0)),dashed);
draw(P--P+r*k--wheel(-1.2));
label("$(x,y)$",P+r*k,E);
label("$\theta$",P+r*k,WSW);
label("$\phi$",P-0.7*dplanecur(x0),2*S);

//draw(O--(1.7,0),invisible);
