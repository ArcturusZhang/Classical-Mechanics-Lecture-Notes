if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-22";
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
//两个物体以完全粗糙的表面相接触约束
pair O,O1,A[],B[],vec,P,Q,tan;
O = (0,0);
O1 = (2,0);
A[1] = (0.2,0);
A[2] = (0.3,0.1);
A[3] = (0.5,0.6);
A[4] = (1,0.8);
A[5] = (1.7,0.3);
A[6] = (1.65,0);
path bodyA,bodyB;
bodyA = A[1]..A[2]..A[3]..A[4]..A[5]..A[6];
draw(bodyA,linewidth(0.8bp));
draw(O--O1);
int imax = 25;
vec = 0.35*(-0.1,-0.2);
for(int i=1;i<imax;i=i+1){
P = interp(O,O1,1./imax*i);
draw(P--P+vec);
}
P = relpoint(bodyA,0.65);
tan = 0.5*reldir(bodyA,0.65);
Q = P+0.7*(0.2,0.5);
label("$P$",P,SW);
draw(shift(Q)*scale(length(Q-P))*unitcircle,linewidth(0.8bp));
draw(Label("$\delta \boldsymbol{r}_1$",EndPoint,NNE),P--P+tan,Arrow);
draw(Label("$\delta \boldsymbol{r}_2$",EndPoint,S),P--P+tan,Arrow);
draw(Label("$\boldsymbol{R}_1$",EndPoint),P--P-0.5*dir(80),Arrow);
draw(Label("$\boldsymbol{R}_2$",EndPoint),P--P+0.5*dir(80),Arrow);
