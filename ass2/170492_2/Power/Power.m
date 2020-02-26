% clear all;
% clc;
% clear all;
function Power()
data = xlsread('Power/Power.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
relerr=data(11,1);
x=zeros(n,1);
x(1,1)=1;

iters=50;
for i=1:iters
    x_temp1 = A*x;
    lambda(i) = max(abs(x_temp1));
    x_temp2 = x_temp1/lambda(i);
    x = x_temp2;
    if i>2
    if (abs(lambda(i)-lambda(i-1))*100/lambda(i)) < relerr
        break;
    end
    end
end
fileID=fopen('Power/Power.txt','w');
fprintf(fileID,'Direct Power method\n\n');
fprintf(fileID,'Eigenvalue\n%f\n\n',lambda(i));
fprintf(fileID,'Eigenvector\n');
fprintf(fileID,'%f\n',x);
fprintf(fileID,'\n\nIterations\n%d\n',i);
fclose(fileID);
end
