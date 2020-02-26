function [X,Y] = AdamsBashforth(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
X=zeros(n,1);
Y=zeros(n,1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end
Y(1,1)=y0;

Y(2,1)=y0+h*f(X(1,1),Y(1,1));
syms y_3;
Eq = y_3 == Y(2,1) + h*(3/2*f(X(2,1),Y(2,1)) - 1/2*f(X(1,1),Y(1,1)));
Y(3,1)=solve(Eq,y_3);
syms y_4;
Eq = y_4 == Y(3,1) + h*(23/12*f(X(3,1),Y(3,1)) - 4/3*f(X(2,1),Y(2,1)) + 5/12*f(X(1,1),Y(1,1)));
Y(4,1)=solve(Eq,y_4);

for i=5:n
    x_old1=X(i-1,1);
    x_old2=X(i-2,1);
    x_old3=X(i-3,1);
    x_old4=X(i-4,1);
    y_old1=Y(i-1,1);
    y_old2=Y(i-2,1);
    y_old3=Y(i-3,1);
    y_old4=Y(i-4,1);
    
    syms y_new;
    z_old1 = 55/24*f(x_old1,y_old1);
    z_old2 = 59/24*f(x_old2,y_old2);
    z_old3 = 37/24*f(x_old3,y_old3);
    z_old4 = 3/8*f(x_old4,y_old4);
    Eq = y_new == y_old1 + h*( z_old1-z_old2+z_old3-z_old4);
    Y(i,1)=solve(Eq,y_new);
end


fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_AdamsBashforth');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-yo');
legend(l,'Adams-Bashforth');
hold on;
end