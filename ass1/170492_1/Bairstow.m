function Bairstow(f,a,a0,n)

fprintf('Please Write the values of r and s:\n');
r = input('r: ');
s = input('s: ');

% r=2;
% s=-2;

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
    
fprintf('I am assuming the allowable error in  function value = 1e-5 \n');
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
    
    b(n)=a(n);
    b(n-1)=a(n-1)+r*b(n);
    for j= (n-2):-1:1
        b(j)= double(a(j)+r*b(j+1)+s*b(j+2));
    end
    b0 = a0+r*b(1)+s*b(2);
    c(n)=b(n);
    c(n-1)=b(n-1)+r*c(n);
    for k= (n-2):-1:1
        c(k)= double(b(k)+r*c(k+1)+s*c(k+2));
    end
    c0 = b0+r*c(1)+s*c(2);
    mat = [c(1) c(2);c(2) c(3)];
    delrs = pinv(mat)*[-b0;-b(1)];
    r_new = double(r + delrs(1));
    s_new = double(s + delrs(2));
    
    e_r = double(abs((r_new-r)*100/r));
    e_s = double(abs((s_new-s)*100/s));
    
    
    iteration(i)=i;
    relerrR(i)=e_r;
    
    relerrS(i)=e_s;
    
    
    
     if (( e_r < A_RE ) && ( e_s < A_RE ))
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Relative Approximation Error\n');
        fprintf('Number of iterations = %i', i);
        break;
    end

    if(i==iters) 
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Number of Iteration\n');
        fprintf('Number of iterations = %i\n', i);
        break;
    end

    
    root1 = double((r + sqrt(r^2 + 4*s))/2);
    root2 = double((r - sqrt(r^2 + 4*s))/2);
    
    temp1= double(real(abs(f(root1))));
    temp2= double(real(abs(f(root2))));
    

    if(temp1<=F_E && temp2<=F_E)
        fprintf('\n___________________________________________________\n\n');
        fprintf('Stoping Criteria = Function value close enough to 0\n');
        fprintf('Number of iterations = %i', i);
        break;
    end 
    
    
%     for q=1:n
%         if(q==1)
%             fprintf('\n\n\n Iteration %i:  ',i);
%             fprintf('\n b[0]: %f  ',b0);
%         end
%         fprintf('b[%i]: %f  ',q,b(q));
%     end
%     clear q;
%     for q=1:n
%         if(q==1)
%             fprintf('\n c[0]: %f  ',c0);
%         end
%         fprintf('c[%i]: %f  ',q,c(q)); 
%         
%     end
%     
%     fprintf('\n r: %f  ',r); 
%     fprintf('s: %f  ',s); 
%     fprintf('\n Roos of the equation (x^2-r*x-s) : %f , %f ',root1,root2 ); 
     
    
    r = r_new;
    s = s_new;
    
    
    
    
 
end

fprintf('\nRoots of the equation are:  %f , %f \n\n',root1,root2);

fprintf('___________________________________________________\n\n');

figure(1)
fplot(f);
title('f(x) vs x');
xlabel('x') ;
ylabel('f(x)') ;

hold on;
figure(2)
plot(iteration,relerrR);
plot(iteration,relerrS);

title('Relative Error vs iteration number');


xlabel('Iteration Number') ;
ylabel('Approximate Relative Error') ;

hold off;

end
