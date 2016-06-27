if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-61";
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
//阻尼放大因子与频率比的关系
picture tmp;
pair O;
real gamma,omega,xs,l;
path clp;
real kappa(real omega){
return 1/(sqrt((1-omega**2)**2+(gamma*omega)**2));
}
pair mcurve(real gamma){
return (sqrt((2-gamma**2)/2),2/(gamma*sqrt(4-gamma**2)));
}
xs = 2.5;
draw(Label("$\dfrac{\omega_p}{\omega_0}$",EndPoint),xscale(xs)*(O--(2.75,0)),Arrow);
draw(Label("$\kappa$",EndPoint),O--(0,5.5),Arrow);
draw(tmp,graph(mcurve,0.2,0.6),dashed);
gamma = 0.5;
draw(tmp,graph(kappa,0,3),red+linewidth(1bp));
gamma = 0.3;
draw(tmp,graph(kappa,0,3),orange+linewidth(1bp));
gamma = 0.2;
draw(tmp,graph(kappa,0,3),green+linewidth(1bp));
gamma = 0;
draw(tmp,graph(kappa,0,3),blue+linewidth(1bp));
clp = box((0,0),(2.5,5.2));
clip(tmp,clp);
//画刻度
l = 0.05;
for(int i=1;i<=10;i=i+1){
draw(tmp,(0.25*i,l)--(0.25*i,0));
}
for(int i=1;i<=10;i=i+1){
draw((0,0.5*i)--(l,0.5*i));
}
add(xscale(xs)*tmp);
erase(tmp);
label("$0.5$",(0,0.5*1),W);
label("$1.0$",(0,0.5*2),W);
label("$1.5$",(0,0.5*3),W);
label("$2.0$",(0,0.5*4),W);
label("$2.5$",(0,0.5*5),W);
label("$3.0$",(0,0.5*6),W);
label("$3.5$",(0,0.5*7),W);
label("$4.0$",(0,0.5*8),W);
label("$4.5$",(0,0.5*9),W);
label("$5.0$",(0,0.5*10),W);
label("$0$",xs*(0,0),S);
label("$0.5$",xs*(0.5*1,0),S);
label("$1.0$",xs*(0.5*2,0),S);
label("$1.5$",xs*(0.5*3,0),S);
label("$2.0$",xs*(0.5*4,0),S);
label("$2.5$",xs*(0.5*5,0),S);
real height,width,right,top;
pair P;
path legendbox;
right = 2.5;
top = 4.8;
width = 0.55;
height = 1.5;
legendbox = xscale(xs)*box((right,top),(right-width,top-height));
fill(shift(0.07,-0.07)*legendbox,black);
unfill(legendbox);
draw(legendbox);
P = (right-width/2,top-1*height/8);
label("$\gamma=0$",xscale(xs)*P,blue);
P = (right-width/2,top-3*height/8);
label("$\gamma=0.2$",xscale(xs)*P,green);
P = (right-width/2,top-5*height/8);
label("$\gamma=0.3$",xscale(xs)*P,orange);
P = (right-width/2,top-7*height/8);
label("$\gamma=0.5$",xscale(xs)*P,red);
