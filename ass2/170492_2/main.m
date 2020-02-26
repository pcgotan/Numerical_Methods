clear all;
clc;
clear all;

currentFolderContents = dir(pwd);          
currentFolderContents (~[currentFolderContents.isdir]) = [];
for i = 3:length(currentFolderContents) 
   addpath(['./' currentFolderContents(i).name]) 
end

fprintf("Hola, Welcome back\n\n");

fprintf("There are two problems is assigment 2\n");
fprintf("Which problem do you want to solve\n");
whichpro = input('Problem 1. Linear equation solver\nProblem 2. Eiganvalve finder\n: ','s');
if( strcmpi(whichpro,'1'))
        fprintf("\n\nPlease Select any task given below\n");
        fprintf(['A.Solve a System of Equation ', ...
                '\nB.Perform a LU decomposition', ...   
                '\nC.Perform a Matrix Inversion\n']);

        selectany = input('\nSelect any? (A/B/C)\n: ','s');
        if( strcmpi(selectany,'A'))    
            Is_tri_dia= input('Is system tridiagonal? (Y/N)\n: ','s');
            if( strcmpi(Is_tri_dia,'Y'))
                thomas();
            elseif( strcmpi(Is_tri_dia,'N'))
                gauss_elimination();
            else
                fprintf("Please choose correct option(Y/N)\n");
            end   

        elseif( strcmpi(selectany,'B'))
            Is_sym= input('Is the matrix symmetric and positive definite? (Y/N)\n: ','s');
            if( strcmpi(Is_sym,'Y'))
                cholesky();
            elseif( strcmpi(Is_sym,'N'))
                DoOrCrout= input('Choose a method (1/2)\n1.Dolittle\n2.Crout\n: ','s');
                if( strcmpi(DoOrCrout,'1'))
                    dolittle();
                elseif( strcmpi(DoOrCrout,'2'))
                    crout();
                else
                    fprintf("Please choose correct option\n");
                end

            else
                fprintf("Please choose correct option\n");
            end

        elseif( strcmpi(selectany,'C'))    
            gauss_jordon_inv();

        else
            fprintf("Sorry for the intruption but you have select an invalid option\n");
        end


elseif( strcmpi(whichpro,'2'))
    fprintf("\n\nSelect ''L'' to find the largest eiganvalue\n");
    fprintf("Select ''A'' to find all eiganvalues:\n ");
    whichpro = input('','s');

    if( strcmpi(whichpro,'L'))
        Power();
    elseif( strcmpi(whichpro,'A'))
        QR();
    else
        fprintf("Choosing a right option would be a good idea.\nSo please choose the right one.");
        
    end
     
        
        
    
    
   
    
        
else
    fprintf("You have chosen wrong problem number\nThere are only 2 problems in this assignment\n");   
end
    









