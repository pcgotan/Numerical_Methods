function LeastSquare(x,y,m)
n=size(x,1);
b=zeros(m+1,1);
for i=1:n
    for j=1:m+1
        %Vector consisting of sums of powers of x multiplied with y's
        b(j)=b(j)+y(i)*x(i)^(j-1);
    end
end

p=zeros(2*m+1,1);
for i=1:n
    for j=1:2*m+1
        %sums of power of x
        p(j)=p(j) + x(i)^(j-1);
    end
end

for i=1:m+1
    for j=1:m+1
        % distributing the sums of power of x in a matrix
        A(i,j)=p(i+j-1);
    end
end

c=A\b;

% Evaluating the least square polynomial on graph
t=min(x):0.05:max(x);
n1=size(t,2);
for i=1:n1
    f(i)=c(m+1);
    for j=m:-1:1
        f(i)=c(j)+f(i)*t(i);
    end
end

% Finding Coefficient of Determination
Yavg=sum(y)/n;
s1=0;
s2=0;
for i=1:n
    s1=s1+(y(i)-Yavg)^2;
    g(i)=c(m+1);
    for j=m:-1:1
        g(i)=c(j)+g(i)*x(i);
    end
    s2=s2+(y(i)-g(i))^2;
end

R2=1-s2/s1;

plot(t,f)  % the least square polynomial
hold on
plot(x,y,'r*')  % the data points
grid on
hold off

fileID=fopen('output.txt','w');
fprintf(fileID,'%s \n','Coefficient =');
fprintf(fileID,'%6.3f \n',c);
fprintf(fileID,'\n');
fprintf(fileID,'%s \n','R-sq =');
fprintf(fileID,'%6.4f \n',R2);

end
        
    
