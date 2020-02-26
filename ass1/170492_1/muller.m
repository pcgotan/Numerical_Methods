function muller(f)

% f(1)

fprintf('Please Write three starting points\n');
x0 = input('x0: ');
x1 = input('x1: ');
x2 = input('x2: ');

fprintf('\n\nPlease specify all these stoping criterias...\n');
fprintf('1.Allowable relative approximate error\n');
fprintf('2.Allowable error in Function value\n');
fprintf('3.Maximum Iterations\n\n');

fprintf('I am assuming the allowable relative approximate error = 0.01%% \n');
    que= input('Do you want to change it(Y/N)\n: ','s');
    if (strcmpi(que,'Y') || strcmpi(que,'y'))
        A_RE= input('Allowable relative approximate error\n: ');
    else     
        A_RE = 0.01;
    end
    
fprintf('I am assuming the allowable error in  function value = 0.00001 \n');
    que= input('Do you want to change it(Y/N)\n: ','s');
    if (strcmpi(que,'Y') || strcmpi(que,'y'))
        F_E= input('Write the allowable error in Function value\n: ');
    else     
        F_E = 0.00001;
    end
fprintf('Number of Iteration = 50 \n');
    que= input('Do you want to change it(Y/N)\n: ','s');
    if (strcmpi(que,'Y') || strcmpi(que ,'y'))
        iters = input('Tell me the maximum Iterations\n: ');
    else     
        iters = 50;
    end
    

for i=1:iters
    
    y0=double(f(x0));
    y1=double(f(x1));
    y2=double(f(x2));
    c0=double((y1-y0)/(x1-x0));
    c1=double((y2-y1)/(x2-x1));
    a=double((c1-c0)/(x2-x0));
    b=double(c1+a*(x2-x1));
    x3 = double(x2-(2*y2)/(b+sign(b)*sqrt(b^2-(4*a*y2))));
    e=double((x3-x2)*100/x3);
    iteration(i)=i;
    relerr(i)=e;
    
    if ( abs(e) < A_RE )
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Relative Approximation Error\n');
        fprintf('Number of iterations = %i', i);
        break;
    end
    
    if(i==iters) 
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Number of Iteration\n');
        fprintf('Number of iterations = %i', i);
        break;
    end
    
    if(abs(f(x3))<= F_E)
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Function value close enough to 0\n');
        fprintf('Number of iterations = %i', i);
        break;
    end 
    
%     fprintf('\n      x0       x1        x2        y0       y1        y2       f(x0,x1)   f(x1,x2)     a       b         x3         e \n')
%     disp([x0,x1,x2,y0,y1,y2,c0,c1,a,b,x3,e]);

    x0=x1;
    x1=x2;
    x2=x3;
    
    
    
    
end

fprintf('\nRoot of the equation is: %f\n\n',x3);

fprintf('___________________________________________________\n\n');
figure(1)
fplot(f);
title('f(x) vs x');
xlabel('x') ;
ylabel('f(x)') ;

figure(2)
plot(iteration,relerr);
title('Relative Error vs iteration number');
xlabel('Approximate Relative Error') ;

ylabel('Iteration Number') ;




end
