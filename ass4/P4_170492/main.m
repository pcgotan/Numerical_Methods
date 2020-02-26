clear all;
clc;
clear all;
currentFolderContents = dir(pwd);          
currentFolderContents (~[currentFolderContents.isdir]) = [];
for i = 3:length(currentFolderContents) 
   addpath(['./' currentFolderContents(i).name]) 
end

display('Enter the Question number: ');
str=input(' 1: Q1. \n 2: Q2. \n ','s');
if str=='1'
    method=menu ('Choose one method',' Euler Forward','Euler Backward','Trapezoidal','4th-order Adams-Bashforth','4th-order Adams-Moulton','4th-order Backward Difference Formulation (BDF)','4th Order Runge-Kutta');
    fileid=fopen('Q1input.txt','r');
    str=fgets(fileid);
    f=str2func(str);
    x0=fscanf(fileid,'%f',1);
    y0=fscanf(fileid,'%f',1);
    xf=fscanf(fileid,'%f',1);
    h=fscanf(fileid,'%f',1);
    fclose(fileid);
    
    if method==1
        Euler_F(f,x0,y0,xf,h);
    elseif method==2
        Euler_B(f,x0,y0,xf,h);
    elseif method==3
        Trapezoidal(f,x0,y0,xf,h);
    elseif method==4
        AdamsBashforth(f,x0,y0,xf,h);
    elseif method==5
        AdamsMoulton(f,x0,y0,xf,h);
    elseif method==6
        BDF(f,x0,y0,xf,h);
    elseif method==7
        RKmethod(f,x0,y0,xf,h);
    end
    
elseif str=='2'
    method2=menu ('Choose one method','2nd order Backward Difference','2nd order Central Difference with Ghost Node');
    if method2==1
        BackDiff();
    elseif method2==2
        GhostNode();
    end
end
    