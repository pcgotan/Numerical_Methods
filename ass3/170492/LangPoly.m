function LangPoly(x,y)
digits(6);
n=size(x,1)-1;
syms X
sm = 0;
for i = 1 : n+1
  pr = 1;
  for j = 1 : n+1
    if j ~= i
      pr = pr * (X - x(j))/(x(i) - x(j));
    end
  end
  sm = sm + y(i) * pr;
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




