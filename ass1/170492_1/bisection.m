% clear all
% clc
% clear all
function bisection()


%This is the bisection method baby
% syms fx a b x;
fx = input('Write your f(x): ','s');
f = inline(fx);

l = input('Write 1st point:\n ');
r = input('Write 2nd point:\n ');
mini=min(l,r);
maxi=max(l,r);


if(f(l)==0)
    fprintf('It is your Lucky day!\n');
    fprintf('Root is: %f \n'  , l);
end
if(f(r)==0)
    fprintf('It is your Lucky day!\n');
    fprintf('Root is: %f \n'  , r);
end

while ~(f(l)*f(r)<0)
    fprintf('The guess is incorrect! Enter new guesses\n');
    l = input('Write again 1st point:\n ');
    r = input('Write again 2nd point:\n ');
    if(f(l)==0)
    fprintf('It is your Lucky day!\n');
    fprintf('Root is: %f \n'  , l);
    end
    if(f(r)==0)
        fprintf('It is your Lucky day!\n');
        fprintf('Root is: %f \n'  , r);
    end
end

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
    xnew=[];
    fnew=[];
for i=2:iters
    m=(l+r)/2;
    if f(r)*f(m)<0
        l=m;
    else
        r=m;
    end

    if f(l)*f(m)<0
        r=m;
    else
        l=m;
    end
    
    
    if(f(m)==0)
        fprintf('------> Hurrey! It is your lucky day  <-------\n');
        break;
    end

    xnew(1)=0;
    xnew(i)=m;
    fnew(1)=f(0);
    fnew(i)=f(m);
    error=abs((xnew(i)-xnew(i-1))*100/xnew(i));
    
    iteration(i)=i;
    relerr(i)=error;
%     plot(error)
    if (( error) < A_RE )
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
    
    if(abs(f(m))<= F_E)
        fprintf('___________________________________________________\n\n');
        fprintf('Stoping Criteria = Function value close enough to 0\n');
        fprintf('Number of iterations = %i', i);
        break;
    end      
end
fprintf('\nRoot of the equation is  %f\n\n ', m);
fprintf('___________________________________________________\n\n');

figure(1)

ezplot(f,[mini-10,maxi+10]);grid on;
title('f(x) vs x');
xlabel('x') ;
ylabel('f(x)') ;

figure(2)
plot(iteration,relerr);
title('Relative Error vs iteration number');
xlabel('Approximate Relative Error') ;

ylabel('Iteration Number') ;



ezplot(f,[mini-10,maxi+10]);grid on;
end


    
    

    
    
        



