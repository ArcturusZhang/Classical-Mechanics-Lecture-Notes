if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-99";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("siunitx");
import graph;
import math;
size(250);
//理论力学：30页1.20
picture tmp;
pair O,i,j,k;
real R1,R2,r,R,H,alpha,phi,r0,l;
path clp;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
pair cir(real theta){
return r*cos(theta)*i+r*sin(theta)*j+r/Tan(alpha)*k;
}
alpha = 20;
R2 = 0.5;
R1 = 2;
r = R2;
draw(graph(cir,0,2*pi),linewidth(0.8bp));
draw(tmp,graph(cir,0,2*pi),linewidth(0.8bp)+dashed);
clp = box((-R1,r/Tan(alpha)),(R1,10*r/Tan(alpha)));
unfill(clp);
clip(tmp,clp);
add(tmp);
erase(tmp);
r = R1;
draw(graph(cir,0,2*pi),linewidth(0.8bp));
pair slop(real t){
return t*cos(phi)*i+t*sin(phi)*j+t/Tan(alpha)*k;
}
phi = atan(j.x/i.x)+asin((i.y*j.x-i.x*j.y)/(k.y*sqrt(i.x**2+j.x**2))*Tan(alpha))+pi;
draw(graph(slop,R2,R1),linewidth(0.8bp));
draw(graph(slop,0,R2),linewidth(0.8bp)+dashed);
r0 = 0.1;
R = interp(R2,R1,0.7);
l = 0.5;
fill(shift(slop(R)+r0*dir(degrees(slop(R))+90))*scale(r0)*unitcircle,black);
draw(slop(R)--slop(R)+l*dir(0));
draw(slop(R2)--((slop(R)+l*dir(0)).x,slop(R2).y));
draw(Label("$h$",MidPoint,Relative(W)),slop(R)+0.6*l*dir(0)--((slop(R)+0.6*l*dir(0)).x,slop(R2).y),Arrows);
r0 = 0.5;
draw(Label("$\alpha$",MidPoint,Relative(E)),arc(O,r0,degrees(slop(R2)),90));
phi = atan(j.x/i.x)-asin((i.y*j.x-i.x*j.y)/(k.y*sqrt(i.x**2+j.x**2))*Tan(alpha));
draw(graph(slop,R2,R1),linewidth(0.8bp));
draw(graph(slop,0,R2),linewidth(0.8bp)+dashed);
H = 2;
draw(slop(R2)--slop(R2)+H*dir(-90),linewidth(1bp));
draw(xscale(-1)*(slop(R2)--slop(R2)+H*dir(-90)),linewidth(1bp));
draw((0,slop(R2).y)+1.1*H*dir(-90)--1.1*R1/Tan(alpha)*dir(90),dashed);
draw(Label("$R_1$",MidPoint,Relative(E)),R1/Tan(alpha)*k--slop(R1));
draw(Label("$R_2$",MidPoint,Relative(E)),R2/Tan(alpha)*k--slop(R2));
label("$O$",O,SW);
