% clear all;
% clc;
% clear all;
function gauss_elimination()

data = xlsread('gauss_elimination.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
b = xlsread('gauss_elimination.xlsx','Sheet1','T:T');



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


for(k=1:n-1)
    for(i=k+1:n)
        l(i,k)=A(i,k)/A(k,k);
        for(j=1:n)
            A(i,j)=A(i,j)-l(i,k)*A(k,j);
        end
        b(i)=b(i)-l(i,k)*b(k); 
    end
end

x(n)=b(n)/A(n,n);   
for(i=n-1:-1:1)
    sum=0;
    for(j=i+1:n)
        sum=sum+A(i,j)*x(j);     
    end
    x(i)=(b(i)-sum)/A(i,i); 
end

fileID=fopen('gauss_elimination/gauss_elimination.txt','w');

fprintf(fileID,'A(upper triangualar matrix):\n\n');
for i=1:n
    for j=1:n
        fprintf(fileID,'%f \t\t' ,A(i,j));
    end
    fprintf(fileID,'\n');
end
fprintf(fileID,'\n\n');
fprintf(fileID,'Solution vector x:\n');
fprintf(fileID,'%f \n' ,x);
fclose(fileID);
        
end

