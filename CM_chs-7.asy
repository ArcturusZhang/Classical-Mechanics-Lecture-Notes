if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-7";
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
size(300);
//伽利略变换
pair O,x,y,z,v,r;
O = (0,0);
x = 0.8*dir(-135);
y = dir(0);
z = dir(90);
v = (2/3,1/3);
r = (0.9,1.2);
draw(Label("$x$",EndPoint),O--x,Arrow);
draw(Label("$y$",EndPoint),O--y,Arrow);
draw(Label("$z$",EndPoint),O--z,Arrow);
label("$O$",O,W);
draw(Label("$x'$",EndPoint),v--v+x,Arrow);
draw(Label("$y'$",EndPoint),v--v+y,Arrow);
draw(Label("$z'$",EndPoint),v--v+z,Arrow);
label("$O'$",v,SE);
draw(Label(rotate(degrees(v))*"$\boldsymbol{v}_0 t$",Relative(0.7),Relative(W)),O--v,red,Arrow);
draw(Label("$\boldsymbol{r}$",MidPoint,Relative(W)),O--r,Arrow);
draw(Label("$\boldsymbol{r}'$",MidPoint,Relative(E)),v--r,Arrow);

//draw((0,0)--(2,0),invisible);
