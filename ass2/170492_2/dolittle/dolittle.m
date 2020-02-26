
function dolittle()
data = xlsread('dolittle/dolittle.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
b = xlsread('dolittle/dolittle.xlsx','Sheet1','T:T');

 %pivoting
for j=1:n-1
    for z=2:n
        if A(j,j)==0
            t=A(j,:);
            A(j,:)=A(z,:);
            A(z,:)=t;
            
            t=b(j);
            b(j)=b(z);
            b(z)=t;
        end
        
    end
end


m=n;
u=zeros(m);
l=zeros(m);
for j=1:m
    l(j,j)=1;
end
for j=1:m
    u(1,j)=A(1,j);
end
for i=2:m
    for j=1:m
        for k=1:i-1
            s1=0;
            if k==1
                s1=0;
            else
            for p=1:k-1
                s1=s1+l(i,p)*u(p,k);
            end
            end
            l(i,k)=(A(i,k)-s1)/u(k,k);
           end
         for k=i:m
             s2=0;
           for p=1:i-1
               s2=s2+l(i,p)*u(p,k);
           end
           u(i,k)=A(i,k)-s2;
         end
    end
end


y(1)=b(1)/l(1,1);
for(i=2:n)
sUm=0;
for(j=1:i-1)
    sUm=sUm+l(i,j)*y(j);     
end
y(i)=(b(i)-sUm)/l(i,i); 
end

y=y';

% lT=l';
x(n)=y(n)/u(n,n);
for(i=n-1:-1:1)
sUm=0;

for(j=i+1:n)
    sUm=sUm+u(i,j)*x(j);     
end
x(i)=(y(i)-sUm)/u(i,i); 
end

fileID=fopen('dolittle/dolittle.txt','w');

fprintf(fileID,'L matrix is: \n\n');
for i=1:n
    for j=1:n
        fprintf(fileID,'%f \t\t' ,l(i,j));
    end
    fprintf(fileID,'\n');
end
fprintf(fileID,'\n\nU matrix is: \n\n');
for i=1:n
    for j=1:n
        fprintf(fileID,'%f \t\t' ,u(i,j));
    end
    fprintf(fileID,'\n');
end

fprintf(fileID,'\n\nSolution vactor is: \n\n');

fprintf(fileID,'%f \n' ,x);
fclose(fileID);

end
