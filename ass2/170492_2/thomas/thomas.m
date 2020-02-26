% clear all;
% clc;
% clear all;
function thomas()
n = xlsread('thomas.xlsx','Sheet1','A1');
l = xlsread('thomas.xlsx','Sheet1','E:E');
d = xlsread('thomas.xlsx','Sheet1','F:F');
u = xlsread('thomas.xlsx','Sheet1','G:G');
b = xlsread('thomas.xlsx','Sheet1','I:I');
alpha(1)=d(1);
beta(1)=b(1);
for(j=2:n)
      alpha(j)=d(j)-(l(j)/alpha(j-1))*u(j-1);
      beta(j)=b(j)-(l(j)/alpha(j-1))*beta(j-1);
end
x(n)=beta(n)/alpha(n);
for(j=n-1:-1:1)
      x(j)=(beta(j)-u(j)*x(j+1))/alpha(j);
      
end
fileID=fopen('thomas/thomas.txt','w');
fprintf(fileID,'Solution using thomas algorithm: \n\n');
fprintf(fileID,'%f \n' ,x);
fclose(fileID);
end

