if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-36";
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
//作用波波面示意图
picture pic;
string[] text = {"$t_0$","$t$","$t'$"};
real[] taus = {2,2.5,3};
real[] sigmas = {2.5,3.5,4.5};
for(real tau : taus){
pair para1(real sigma){
return (sigma*tau,(tau**2-sigma**2)/2);
}
draw(pic,rotate(56)*graph(para1,2,5),Arrow);
}
int i = 0;
for(real sigma:sigmas){
pair para2(real tau){
return (sigma*tau,(tau**2-sigma**2)/2);
}
draw(pic,Label(text[i],BeginPoint,black),rotate(56)*graph(para2,1.8,3.15),red+dashed);
i = i+1;
}
real tau = taus[1];
real sigma = sigmas[1];
pair para1dir(real sigma,real tau){
return (tau,-sigma);
}
pair para1(real sigma,real tau){
return (sigma*tau,(tau**2-sigma**2)/2);
}
dot(pic,rotate(56)*para1(sigma,tau));
draw(pic,Label("$\boldsymbol{p}$",EndPoint,Relative(W)),rotate(56)*(para1(sigma,tau)--para1(sigma,tau)+0.5*para1dir(sigma,tau)),Arrow);
label(pic,"$W(\boldsymbol{r})=S_0+Et$",rotate(56)*para1(sigmas[1],taus[2]),6*N);
add(pic);
