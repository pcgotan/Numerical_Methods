% clear all;
% clc;
% clear all;
function cholesky()
data = xlsread('cholesky.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
b = xlsread('cholesky.xlsx','Sheet1','T:T');


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

if(sum(A,'all')>0)
    for(j=1:n)
        sUm=0;
        for(k=1:j-1)
            sUm=sUm+l(j,k)*l(j,k);      
        end
        l(j,j)= sqrt(A(j,j)-sUm);
        sUm=0;
        for(i=j+1:n)
            for(k=1:j-1)
            sUm=sUm+l(i,k)*l(j,k);      
            end
            l(i,j)=(A(i,j)-sUm)/l(j,j);
            sUm=0;
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
    
    lT=l';
    x(n)=y(n)/lT(n,n);
    for(i=n-1:-1:1)
    sUm=0;
    
    for(j=i+1:n)
        sUm=sUm+lT(i,j)*x(j);     
    end
    x(i)=(y(i)-sUm)/lT(i,i); 
    end
    
else
    fprintf("Try another matrix because it is not a positive definite matrix");
end
fileID=fopen('cholesky/cholesky.txt','w');
fprintf(fileID,'%f \n' ,x);
fclose(fileID);
end
