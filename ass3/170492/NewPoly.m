function NewPoly(x,y)
digits(6);
format long g
n=size(x,1);
syms X
a(1) = y(1);
for k = 1 : n - 1
   d(k, 1) = (y(k+1) - y(k))/(x(k+1) - x(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(x(k+j) - x(k));
   end
end
for j = 2 : n
   a(j) = d(1, j-1);
end
sm=0;
for i = 1 : n
  pr = 1;
  if i>=2
    for j = 1 : i-1
      pr = pr * (X - x(j));
    end
  end
  sm = sm + a(i)*pr;
end
plot(x,y,'r*') 
hold on
fplot(simplify(sm),[0,5]) 
ylim([0,2]);
grid on
hold off
fileID=fopen('output.txt','w');
fprintf(fileID,'%s \n','Expression =');
fprintf(fileID,'%s',(vpa((simplify(sm)),3)));
end




