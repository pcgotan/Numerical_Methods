function [X,Y] = AdamsMoulton(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
X=zeros(n,1);
Y=zeros(n,1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end
Y(1,1)=y0;
syms y_2;
Eq = y_2 == Y(1,1) + h*(f(X(2,1),y_2));
Y(2,1)=solve(Eq,y_2);

syms y_3;
Eq = y_3 == Y(2,1) + h*(5/12*f(X(3,1),y_3) +2/3*f(X(2,1),Y(2,1)) -1/12*f(X(1,1),Y(1,1)));
Y(3,1)=solve(Eq,y_3);
for i=4:n
    x_new=X(i,1);
    x_old1=X(i-1,1);
    x_old2=X(i-2,1);
    x_old3=X(i-3,1);
    y_old1=Y(i-1,1);
    y_old2=Y(i-2,1);
    y_old3=Y(i-3,1);
    
    syms y_new;
    z_new = 3/8*f(x_new,y_new);
    z_old1 = 19/24*f(x_old1,y_old1);
    z_old2 = 5/24*f(x_old2,y_old2);
    z_old3 = 1/24*f(x_old3,y_old3);
    Eq = y_new == y_old1 + h*( z_new + z_old1 - z_old2 + z_old3);
    Y(i,1)=solve(Eq,y_new);
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_Adams-Moulton');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-ko');
legend(l,'Adams-Moulton');
hold on;
end