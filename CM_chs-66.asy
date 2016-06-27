if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-66";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("amssymb");
size(200);
import graph;
import math;
//刚体的定轴转动

pair O,i,j,k,ii,jj,P;
real a,r,alpha;
O = (0,0);
a = 1;
alpha = 3;
i = (-a/sqrt(1+alpha**2),-a/sqrt(1+alpha**2));
j = (a,0);
k = (0,a);
draw(Label("$X$",EndPoint),O--2*i,Arrow);
draw(Label("$Y$",EndPoint),O--2*j,Arrow);
draw(Label("$Z$",EndPoint),O--2*k,Arrow);
label("$O$",O,W);
path cir;
cir = yscale(1/alpha)*scale(a)*unitcircle;
draw(cir,dashed);
ii = relpoint(cir,-0.16);
jj = relpoint(cir,0.13);
draw(Label("$x$",EndPoint),O--2*ii,Arrow);
draw(Label("$y$",EndPoint),O--2*jj,Arrow);
dot(1.0*k);
label("$O_1$",1.0*k,W);
draw(Label("$z$",EndPoint,W),O--1.7*k,Arrow);
r = 0.3;
real d2tan(pair de){
return atan(alpha*de.y/de.x)/pi*180;
}
P = a*cos(pi/3)*i+a*sin(pi/3)*j+1.2*k;
draw(Label("$\boldsymbol{r}$",MidPoint,Relative(W)),O--P,red,Arrow);
draw(P--(P.x,-a/alpha*sqrt(1-P.x*P.x/a/a))--O,red+dashed);
draw(P--(P-(P.x,-a/alpha*sqrt(1-P.x*P.x/a/a))),red+dashed);
label("$P$",P,N);
draw(Label("$\phi$",MidPoint,Relative(E)),yscale(1/alpha)*arc(O,r,d2tan(i)-180,d2tan(ii)),Arrow);
draw(Label("$\phi$",MidPoint,E),yscale(1/alpha)*arc(O,r,d2tan(j),d2tan(jj)),Arrow);
