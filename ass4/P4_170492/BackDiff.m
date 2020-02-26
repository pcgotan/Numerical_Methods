function BackDiff()
X(1) = 0;
a(1) = -(X(1)+3)/(X(1)+1);
b(1) = (X(1)+3)/(X(1)+1)^2;
f(1) = 2*(X(1)+1)+3*b(1);
h=0.5;
for i=2:5
    X(i) =X(i-1)+h;
    a(i)= -(X(i)+3)/(X(i)+1);
    b(i) = (X(i)+3)/(X(i)+1).^2;
    f(i) = 2*(X(i)+1)+3*b(i); 
end
T = sym('T', [1 5]);
T(1) = subs(T(1),5);
for i=2:4
    coff_1 = (1/h^2 - a(i)/(2*h));
    coff_2 = (b(i)-2/h^2);
    coff_3 = (1/h^2 + a(i)/(2*h));
    eqn(i-1) = coff_1*T(i-1) + coff_2*T(i) + coff_3*T(i+1) == f(i);
end
eqn(4) = T(5)  == (4*T(4) - T(3))/3;
[A,b] = equationsToMatrix([eqn(1),eqn(2), eqn(3),eqn(4)], [T(2),T(3),T(4),T(5)]);

n= size(A,1);
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



y(1)=5;
for i=2:n+1;
      y(i)=x(i-1);
      
end
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','x      Temp');
fprintf(fileid,'\n');
for i=1:n+1
    fprintf(fileid,'%.5f %.5f\n',X(i),y(i));
end
fclose(fileid);
l=plot(X,y,'-r+');
hold on;
end
