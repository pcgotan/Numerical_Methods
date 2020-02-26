function [X,Y] = BDF(f,x0,y0,xf,h)
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
Eq = 3/2*y_3 - 2*Y(2,1) + 1/2*Y(1,1) == h*f(X(3,1),y_3);
Y(3,1)=solve(Eq,y_3);

syms y_4;
Eq = 11/6*y_4 - 3*Y(3,1) + 3/2*Y(2,1) - 1/3*Y(1,1) == h*f(X(4,1),y_4);
Y(4,1)=solve(Eq,y_4);


for i=5:n
    syms y_new;
    Eq = 25/12*y_new -4*Y(i-1,1) + 3*Y(i-2,1) -4/3*Y(i-3,1) + 1/4*Y(i-4,1) == h*f(X(i,1),y_new);
    Y(i,1)=solve(Eq,y_new);
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_BDF4');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-b+');
legend(l,'BDF4');
hold on;
end