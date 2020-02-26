function [X,Y] = RKmethod(f,x0,y0,xf,h)
n=(((xf-x0)/h)+1);
for i=1:n
    X(i,1)=x0+((i-1)*h);
end
Y(1,1)=y0;
for i=1:n-1  
    x=X(i,1);
    y=Y(i,1);
    z1 = f(x,y);
    y1=Y(i,1)+(z1*(h/2));
    x=(X(i+1,1)+X(i,1))/2;
    y=y1;
    z2=f(x,y);
    x=(X(i+1,1)+X(i,1))/2;
    y=Y(i,1)+(z2*(h/2));
    z3=f(x,y);
    x=X(i+1,1);
    y=Y(i,1)+(z3*h);
    z4=f(x,y);
    Y(i+1,1)=Y(i,1)+((1/6)*(z1+(2*z2)+(2*z3)+z4)*h);
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      y_RK4');
fprintf(fileid,'\n');
for i=1:n
    fprintf(fileid,'%.5f %.5f\n',X(i,1),Y(i,1));
end
fclose(fileid);
l=plot(X,Y,'-*');
legend(l,'RK 4th order');
hold on;
end

