% clear all;
% clc;
% clear all;
function QR()

data = xlsread('QR/QR.xlsx','Sheet1');
n=data(2,1);
A=data(1:1+n-1,4:4+n-1);
relerr=data(11,1);
iters=50;

% A= [4 3 ; 3 3 ];
% n=2;
for p=1:iters
        clear Q;
        clear R;
        Q(:,1)=A(:,1)/norm(A(:,1));
        for i=2:n
            q_size = size(Q);
            temp=0;
            for j=1:q_size(2)
                temp=temp + (A(:,i)'*Q(:,j))* Q(:,j);
            end
            Q(:,i) = A(:,i)-temp;
            Q(:,i) = Q(:,i)/norm(Q(:,i));   
        end
        R=Q'*A;

        for i=1:n
            eiganvalues1(i)=R(i,i);
        end
        
        if p>2
            err = max(abs((eiganvalues1-eiganvalues2)/eiganvalues1));
            if (err*100 < relerr)
                break;
            end
        end
   
        
        A = R*Q;
        eiganvalues2=eiganvalues1;
end
fileID=fopen('QR/QR.txt','w');
fprintf(fileID,'QR decomposition\n\n');
fprintf(fileID,'Eigenvalues\n');
fprintf(fileID,'%f\n',eiganvalues1);
% fprintf(fileID,'\n\nIterations\n%d\n',i);
fprintf(fileID,'\n\niterations\n');
fprintf(fileID,'%d\n',p);
fclose(fileID);


end




