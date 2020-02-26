function [X,Y] = Trapezoidal(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
X=zeros(n,1);
Y=zeros(n,1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end
Y(1,1)=y0;
for i=2:n
    x_old=X(i-1,1);
    x_new=X(i,1);
    y_old=Y(i-1,1);
    syms y_new;
    z_new = f(x_new,y_new);
    z_old = f(x_old,y_old);
    
    Eq = y_new == y_old + (h/2)*(z_new+z_old);
    Y(i,1)=solve(Eq,y_new);
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_Trapezoidal');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
%type('Midpoint.txt');
k=plot(X,Y,'-msquare');
legend(k,'Trapezoidal');
hold on;
end