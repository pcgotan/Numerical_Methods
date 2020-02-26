function [X,Y] = Euler_B(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
X=zeros(n,1);
Y=zeros(n,1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end

Y(1,1)=y0;
for i=2:n
    x=X(i,1);
    y_old=Y(i-1,1);
    syms y_new;
    z = f(x,y_new);
    Eq = y_new == y_old + h*z;
    Y(i,1)=solve(Eq,y_new);
end

fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_euler');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-cdiamond');
legend(l,'Euler_B');
hold on;
end