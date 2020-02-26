function GhostNode()
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
T = sym('T', [1 6]);
T(1) = subs(T(1),5);
T(4)=T(6);
for i=2:5
    coff_1 = (1/h^2 - a(i)/(2*h));
    coff_2 = (b(i)-2/h^2);
    coff_3 = (1/h^2 + a(i)/(2*h));
    eqn(i-1) = coff_1*T(i-1) + coff_2*T(i) + coff_3*T(i+1) == f(i);
end

[A,b] = equationsToMatrix([eqn(1),eqn(2), eqn(3),eqn(4)], [T(2),T(3),T(4),T(5)]);

n= size(A,1);
% l(1)=0;
d(1)=A(1,1);
for i=2:size(A,1)
    l(i) = A(i,i-1);
    u(i-1) = A(i-1,i);
    d(i)=A(i,i);
end
u(size(A,1))=0;

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
l=plot(X,y,'-ko');
hold on;
end
