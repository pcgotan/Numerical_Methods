function [X,Y] = Euler_F(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
X=zeros(n,1);
Y=zeros(n,1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end
Y(1,1)=y0;
for i=2:n  
    x=X(i-1,1);
    y=Y(i-1,1);
    z = f(x,y);
    Y(i,1)=Y(i-1,1)+(z*h);
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_euler');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-gdiamond');
legend(l,'Euler_F');
hold on;
end

