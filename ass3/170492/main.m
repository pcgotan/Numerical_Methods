clear all;
clc;
clear all;
currentFolderContents = dir(pwd);          
currentFolderContents (~[currentFolderContents.isdir]) = [];
for i = 3:length(currentFolderContents) 
   addpath(['./' currentFolderContents(i).name]) 
end
data=dlmread('data.txt');
x=data(:,1);
y=data(:,2);
fprintf("Prashant Chouhan - 170492\n");
fprintf("Assignment 3\n\n");
fprintf("Which Polynomial do you want to fit\n");
whichpro = input('1. Least Square\n2. Lagrange Interpolation\n3. Newton’s Interpolation\n4. Cubic splines\n: ','s');
if( strcmpi(whichpro,'1'))
    m=inputdlg('Degree of polynmial');
    m = str2double(m);
    LeastSquare(x,y,m);
elseif( strcmpi(whichpro,'2'))
    LangPoly(x,y);
elseif( strcmpi(whichpro,'3'))
    NewPoly(x,y);
elseif( strcmpi(whichpro,'4'))
    INput=dlmread('data1.txt');
    n=1;
    l=0;
    while l~=-1
        if INput(n,3)==-1
            l=-1;
        else
            n=n+1;
        end
    end
    y=INput(1:n-1,2);
    x=INput(1:n-1,1);
    t=INput(n+1:end-2,1);
    s0=INput(end,1);
    s1=INput(end,2);
    
    whichspline = input('\n\nChoose one of the methods: \n1. Linear Spline \n2. Quadratic Spline \n3.Natural Cubic Spline \n4.Knot-a-Knot Cubic Spline \n5.Periodic Cubic Spline \n6.Clamped Cubic Spline\n:');
    switch whichspline
        case 1
            LinearSpline(x, y, t)
        case 2
            QuadraticSpline(x, y, t)
        case 3
            NaturalCubicSpline(x, y, t)
        case 4
            NotAKnotCubicSpline(x, y, t )
        case 5
            PeriodicCubicSpline(x, y, t )
        case 6
            ClampedCubicSpline( x, y, t ,s0 ,s1 ) 
    end
end










