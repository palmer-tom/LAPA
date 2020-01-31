% PA 4 - Laplace Equation by Iteration
% Tom Palmer - 101045113
% 31 JAN 2020

% Setup 
clear
clc

% User variables
n = 100; % Number of elements along each axis
iter = 10000; % Maximum numbr of itterations

% Initialize boundary conditions
V = zeros(n);
V(:,1) = 1;


for count = 0:iter
    Vold = V;
    for i = 1:n
        for j = 1:n
            if j == 1
                if i == 1
                    V(j,i) = (Vold(j+1,i) + Vold(j,i+1))/(2);
                elseif i == n
                    V(j,i) = (Vold(j+1,i) + Vold(j,i-1))/(2);
                else
                    V(j,i) = (Vold(j+1,i) + Vold(j,i+1) + Vold(j,i-1))/(3);
                end
            elseif j == n
                if i == 1
                    V(j,i) = (Vold(j-1,i) + Vold(j,i+1))/(2);
                elseif i == n
                    V(j,i) = (Vold(j-1,i) + Vold(j,i-1))/(2);
                else
                    V(j,i) = (Vold(j-1,i) + Vold(j,i+1) + Vold(j,i-1))/(3);
                end
            elseif i == 1
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i+1))/(3);
            elseif i == n
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i-1))/(3);
            else
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i-1) + Vold(j,i+1))/(4);
            end
        end
    end

    V(:,1) = 1;
    V(:,n) = 0;
    
end

figure(1)
[x,y] = meshgrid(1:n,1:n);
surf(x,y,V)
title('Laplace Plot - 2 Boundary')

% Initialize boundary conditions
V = zeros(n);
V(:,1) = 1;
V(:,n) = 1;


for count = 0:iter
    Vold = V;
    for i = 1:n
        for j = 1:n
            if j == 1
                if i == 1
                    V(j,i) = (Vold(j+1,i) + Vold(j,i+1))/(2);
                elseif i == n
                    V(j,i) = (Vold(j+1,i) + Vold(j,i-1))/(2);
                else
                    V(j,i) = (Vold(j+1,i) + Vold(j,i+1) + Vold(j,i-1))/(3);
                end
            elseif j == n
                if i == 1
                    V(j,i) = (Vold(j-1,i) + Vold(j,i+1))/(2);
                elseif i == n
                    V(j,i) = (Vold(j-1,i) + Vold(j,i-1))/(2);
                else
                    V(j,i) = (Vold(j-1,i) + Vold(j,i+1) + Vold(j,i-1))/(3);
                end
            elseif i == 1
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i+1))/(3);
            elseif i == n
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i-1))/(3);
            else
                V(j,i) = (Vold(j-1,i) + Vold(j+1,i) + Vold(j,i-1) + Vold(j,i+1))/(4);
            end
        end
    end
    
    V(1,:) = 0;
    V(n,:) = 0;
    V(:,1) = 1;
    V(:,n) = 1;
    
end

figure(2)
[x,y] = meshgrid(1:n,1:n);
surf(x,y,V)
title('Laplace Plot - 4 Boundary')

Ey = zeros(n);
Ex = zeros(n);

for i = 1:n
    for j = 1:n
        if i == 1
            Ex(j,i) = (V(j,i+1) - V(j,i));
        elseif i == n
            Ex(j,i) = (V(j,i) - V(j,i-1));
        else
            Ex(j,i) = (V(j,i+1) - V(j,i-1))/2;
        end
        if j == 1
            Ey(j,i) = (V(j+1,i) - V(j,i));
        elseif j == n
            Ey(j,i) = (V(j,i) - V(j-1,i));
        else
            Ey(j,i) = (V(j+1,i) - V(j-1,i))/2;
        end
    end
end

figure(3)
[x,y] = meshgrid(1:n,1:n);
surf(x,y,Ex)
title('Plot of Ex')

figure(4)
[x,y] = meshgrid(1:n,1:n);
surf(x,y,Ey)
title('Plot of Ey')

figure(5)
quiver(x,y,Ex,Ey,10)
title('Plot of Electric Field Vectors')




