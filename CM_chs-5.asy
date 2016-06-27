if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-5";
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
size(180);
//切线法线副法线
real hd,hdd;
pair O,x,y,z;
hd = 131+25/60;
hdd = 7+10/60;
O = (0,0);
x = 0.8*dir(90+hd);
y = dir(-hdd);
z = dir(90);
draw(Label("切线",EndPoint),O--x,linewidth(0.8bp));
draw(Label("主法线",EndPoint),O--y,linewidth(0.8bp));
draw(Label("副法线",EndPoint),O--z,linewidth(0.8bp));
draw(x--x+y--y--y+z--z--z+x--cycle);
draw(Label("$\boldsymbol{\tau}$",EndPoint,NW),O--0.4*x,red,Arrow);
draw(Label("$\boldsymbol{n}$",EndPoint,N),O--0.4*y,red,Arrow);
draw(Label("$\boldsymbol{b}$",EndPoint,E),O--0.4*z,red,Arrow);

pair para(real xx){
real yy;
yy = xx**2;
return xx*x+yy*y;
}
draw(graph(para,-1,1));
label("$\begin{array}{c} \mbox{从} \\[-0.5ex] \mbox{切} \\[-0.5ex] \mbox{面} \end{array}$",0.5*x+0.5*z);
label("法平面",0.5*y+0.5*z);
label("密切面",0.4*x+0.6*y);
//draw((0,0)--(1.5,0),invisible);
