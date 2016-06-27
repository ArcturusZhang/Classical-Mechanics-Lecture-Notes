if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-20";
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
//质点沿光滑曲面运动约束
pair O,A[],vec,P,tan;
path surf;
O = (0,0);
A[1] = (-0.7,-1);
A[2] = O;
A[3] = (1.2,0.6);
surf = A[1]..A[2]..A[3];
draw(surf,linewidth(0.8bp));
vec = 0.5*(0.1,-0.06);
int imax=30;
for(int i=1;i<imax;i=i+1){
P = relpoint(surf,1./imax*i);
draw(P--P+vec);
}
label("$P$",O+vec,SE);
tan = 0.9*dir(surf,1);
draw(Label("$\delta\boldsymbol{r}$",EndPoint),O--O+tan,Arrow);
draw(Label("$\boldsymbol{R}$",EndPoint),O--O+rotate(90)*tan,Arrow);
dot(O);
