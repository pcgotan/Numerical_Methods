function NewtonRaphson()

fprintf('please Write the function f(x) and derivative f''(x)\n');
fx = input('f(x) : ','s');
f = inline(fx);

fxd = input('f''(x) : ','s');
fd = inline(fxd);

a = input('Your Initial guess:\n ');
point = a;

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

    
for i=2:iters
    
    x_new=a-f(a)/fd(a);
    
    error=abs((x_new-a)*100/x_new);
    a=x_new;
    
    if error <= A_RE
        fprintf('___________________________________________________\n\n');
        fprintf('Stoping Criteria = Relative Approximation Error\n');
        fprintf('Number of iterations = %i', i);
        break;
    end
    
    if(i==iters) 
        fprintf('___________________________________________________\n\n');
        fprintf('Stoping Criteria = Number of Iteration\n');
        fprintf('Number of iterations = %i', i);
        break;
    end
    
     if(abs(f(a))<= F_E)
        fprintf('___________________________________________________\n\n');
        fprintf('Stoping Criteria = Function value close enough to 0\n');
        fprintf('Number of iterations = %i', i);
        break;
    end
    
    
    
end
fprintf('\nRoot of the equation is  %f\n ', x_new);
fprintf('___________________________________________________\n\n');



fplot(f,[point-10,a+10]); grid on;



        
    






end