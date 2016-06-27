if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-6";
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
size(200);
//第一章例3图
pair O,x,y,A,B;
O = (0,0);
x = (1.5,0);
y = (0,2.5);
draw(Label("$x$",EndPoint),(-x)--x,Arrow);
draw(Label("$y$",EndPoint),(-0.2*y)--y,Arrow);

real para(real xx){
return 2*xx**2;
}
draw(graph(para,-1,1));
//draw((0,0)--(2,0),invisible);
A = (-0.5,para(-0.5));
B = (0.5,para(0.5));
dot(A);
label("$A\left(-p,\dfrac{p}{2}\right)$",A,W);
dot(B);
label("$B\left(p,\dfrac{p}{2}\right)$",B,E);
draw(A--B,dashed);
