% clear all;
% clc;
% clear all;
function gauss_jordon_inv()
data = xlsread('gauss_jordon_inv/gauss_jordon_inv.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
AA=A;
b = xlsread('gauss_jordon_inv/gauss_jordon_inv.xlsx','Sheet1','T:T');
B=eye(n);

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

for j=1:n-1
    for i=j+1:n
        temp= A(i,j)/A(j,j);
        A(i,:)=A(i,:)-A(j,:)*(temp);
        B(i,:)=B(i,:)-B(j,:)*(temp);
 
    end
end

for j=n:-1:2
    for i=j-1:-1:1
        temp= A(i,j)/A(j,j);
        A(i,:)=A(i,:)-A(j,:)*(temp);
        B(i,:)=B(i,:)-B(j,:)*(temp);
       
    end
end

for s=1:n
    temp=A(s,s);
    A(s,:)= A(s,:)/temp;
    B(s,:)= B(s,:)/temp;
end
fileID=fopen('gauss_jordon_inv/gauss_jordon_inv.txt','w');

fprintf(fileID,'inverse of the matrix A is (By Gauss jordan method)\n\n');
for i=1:n
    for j=1:n
        fprintf(fileID,'%f \t\t' ,B(i,j));
    end
    fprintf(fileID,'\n');
end
fclose(fileID);

end
