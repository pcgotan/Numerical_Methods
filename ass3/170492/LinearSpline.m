function LinearSpline(x,y,t)

x1=sort(x);
L=length(t);
Coeff=zeros(2*L,1);
m=1;
for i=1:L
    for j=1:length(x)
        if t(i)<=x1(j)
            break
        end
    end
    k=j-1;
    a=(y(k+1)-y(k))/(x(k+1)-x(k));
    b=y(k) - (x1(k))*(y(k+1)-y(k))/(x(k+1)-x(k));
    y_out(i)= a*t(i)+b;
    Coeff(m)=a;
    Coeff(m+1)=b;
    m=m+2;
end

j=1;
hold on;
for i=1:length(x)-1
    curve=@(l) Coeff(j)*l+Coeff(j+1);
    fplot(curve,[x(i),x(i+1)],'b');
    hndl=get(gca,'Children');
    set(hndl,'LineWidth',2);
    hold on
    j=j+2;
end
scatter(x,y,50,'r','filled')
grid on;
xlim([min(x) max(x)]);
ylim([min(y)-0.5 max(y)+0.5]);
xlabel('x');
ylabel('y');
title('Linear spline')


%Output
fileID=fopen('output.txt','w');
fprintf(fileID,'%s \n','Linear spline');
for i=1:L
    fprintf(fileID,'%6.4f %6.4f \n',t(i),y_out(i));
end

