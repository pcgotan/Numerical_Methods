function QuadraticSpline(x,y,t)

N= length(x)-1;
L= length(t);
% The unknowns are 3*N with ao=0 "Linear Spline"
% Filling Matrix from point matching
V= [0;zeros(2*N,1);zeros(N-1,1)];
Z= zeros(length(V),length(V));
j=1;
f=1;
for i=2:2:2*N    
    Z(i,f:f+2) = [x(j)^2 x(j) 1];
    V(i) = y(j);
    j = j+1;
    Z(i+1,f:f+2) = [x(j)^2 x(j) 1];  
    V(i+1) = y(j);
    f = f+3;
end

% Filling Matrix from smoothing condition
j=1;
l=2;
for i=2*N+2:3*N
    
    Z(i,j:j+1) = [2*x(l) 1];
    Z(i,j+3:j+4) = [-2*x(l) -1];
    j = j+3;
    l = l+1;
end

% Adjusting the value of a1 to be zero "Linear Spline"
Z(1,1)=1;

% Inverting and obtaining the coeffiecients, Plotting
Coeff       =       Z\V;

for i=1:L
    for j=1:length(x)
        if t(i)<=x(j)
            break
        end
    end
    k=j-1;
    a=Coeff(3*k-2);
    b=Coeff(3*k-1);
    c=Coeff(3*k);
    y_out(i)= a*t(i)^2 + b*t(i) + c;
end


j=1;
hold on;
for i=1:N
    curve=@(l) Coeff(j)*l.^2+Coeff(j+1)*l+Coeff(j+2);
    fplot(curve,[x(i),x(i+1)],'g');
    hndl=get(gca,'Children');
    set(hndl,'LineWidth',2);
    hold on
    j=j+3;
end
scatter(x,y,50,'r','filled')
grid on;
xlim([min(x) max(x)]);
ylim([min(y)-1 max(y)+1]);
xlabel('x');
ylabel('y');
title('Quadratic Spline')

%Output
fileID=fopen('output.txt','w');
fprintf(fileID,'%s \n','Quadratic spline');
for i=1:L
    fprintf(fileID,'%6.4f %6.4f \n',t(i),y_out(i));
end