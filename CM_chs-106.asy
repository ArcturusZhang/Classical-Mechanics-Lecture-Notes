if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-106";
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
size(300);
//理论力学：148页4.27
pair O,i,j,k;
O = (0,0);
i = (-sqrt(2)/4,-sqrt(14)/12);
j = (sqrt(14)/4,-sqrt(2)/12);
k = (0,2*sqrt(2)/3);
real a,b,l,h,h1,h2,r;
a = 1;
b = 2;
l = 3;
h = 2;
h1 = 2;
h2 = 3;
pair centercir(real theta){
return a*cos(theta)*i+a*sin(theta)*k;
}
pair planecir(real theta){
return a*cos(theta)*i+b*sin(theta)*j;
}
pair vang(real theta){
return r*cos(theta)*i+h*j+r*sin(theta)*k;
}
pair hang(real theta){
return r*cos(theta)*i+r*sin(theta)*j+h*k;
}
draw(xscale(b*0.975)*yscale(a)*unitcircle,linewidth(1bp));
draw(graph(centercir,0,2*pi),dashed);
draw(graph(planecir,0,2*pi),dashed);
draw(Label("$D$",EndPoint,Relative(W)),-h*k--h1*k,dashed);
draw(-h*k--(-h2*k));
label("$C$",-h*k,SW);
draw(-b*j--b*j,dashed);
draw(b*j--l*j--l*j-h*k--(-l*j-h*k)--(-l*j)--(-b*j/.98),linewidth(1bp));
label("$A$",-l*j,N);
label("$B$",l*j,N);
h = -2.5;
r = 0.4;
draw(Label("$\dot{\theta}$",EndPoint,Relative(E)),graph(hang,-0.5,1.1),Arrow);
h = 2.7;
draw(Label("$\dot{\phi}$",Relative(0.2),Relative(W)),graph(vang,-0.7,1.2),Arrow);
