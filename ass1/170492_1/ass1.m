clear all;
clc;
clear all;
fprintf('                  Root Finder            \n\n');
fprintf('This is developed by Prashant Chouhan(170492)\n');
Ispoly = input('Is your equation a polynomial? (yes/no)\n: ','s');
if( strcmpi(Ispoly,'yes') || strcmpi(Ispoly,'y') )
    fprintf('Write order of polynomial\n');
    n = input('n : ');
    for i=1:n
        fprintf('a[%i] :',n+1-i); 
        a(n+1-i)=input('');
    end
    a0 = input('a[0]: ' );
    syms x
    f=a0;
    for j=1:n
        f = f+a(j)*x^j; 
    end
    f(x)=subs(f,x);


% syms x;
% f=x^4-7.4*x^3+20.44*x^2-24.184*x^1+9.6448;
% f(x)=subs(f,x);
% n=4;
% a(4)=1;
% a(3)=-7.4;
% a(2)=20.44;
% a(1)=-24.184;
% a0 =9.6448;

    
    
    
    
    
    fprintf('\nThis is the list of Methods\n');
    fprintf('1.Muller\n');
    fprintf('2.Bairstow.\n');
    y = input('\nPlease Select any Method\n: ','s');
    if ( strcmpi(y,'Muller') || strcmpi(y,'1') )
        muller(f);
    elseif ( strcmpi(y,'Bairstow') || strcmpi(y,'2') )
        Bairstow(f,a,a0,n);
    else
        fprintf('\n\nYou chose a wrong option!!\n')
        fprintf('Restart the Program and Choose any of the mention above\n')
    
    end  
else
    fprintf('This is the list of Methods\n');
    fprintf('1.Bisection\n');
    fprintf('2.False-position\n');
    fprintf('3.Fixed-Point\n');
    fprintf('4.Newton-Raphson\n');
    fprintf('5.Secant\n');
    
    
    y = input('\nPlease Select any Method\n: ','s');
    if ( strcmpi(y,'Bisection') || strcmpi(y,'1') )
        bisection();
    elseif ( strcmpi(y,'FalsePosition') || strcmpi(y,'2') )
        FalsePosition();
    elseif ( strcmpi(y,'FixedPoint') || strcmpi(y,'3') )
        FixedPoint();
    elseif ( strcmpi(y,'NewtonRaphson') || strcmpi(y,'4') )
        NewtonRaphson();
    elseif ( strcmpi(y,'Secant') || strcmpi(y,'5') )
        Secant();
    else
        fprintf('\n\nYou chose a wrong option!!\n')
        fprintf('Restart the Program and Choose any of the mention above\n')
        
    end
        
end
    


