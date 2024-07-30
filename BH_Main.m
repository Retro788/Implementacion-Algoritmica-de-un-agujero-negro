clc;
clear all;
close all;

%% Problem Definitoion
rng(5);
numberOfVariable = 10;          % Número de variables de entrada
lowerBound = -10*ones(1,10);          % Minimo Límite de las variables de entrada
higherBound = 10*ones(1,10);         % Maximo Límite de las variables de entrada

%% Parameter of BH
numberOfStars = 100; %Numero de estrellas
maxIter = 500; %Maximo numero de interaciones

%% Calling
blackHole = BH(numberOfVariable, lowerBound, higherBound, numberOfStars,maxIter);
[blackHole, bestSolution, bestCost, allBestCost] = BH_Func(blackHole);

%% Results
disp(['BestSolution is: ' num2str(bestSolution)]);
disp(['BestCost is: ' num2str(bestCost)]);
h=figure(1);

semilogx(1:maxIter, allBestCost, 'LineWidth', 2);
title('ObjFunc 2 & Seed 5','FontSize',16);
legend('All Best Costs');
xlabel('Iteration');
ylabel('Best Cost');
grid on;
%saveas(h,'f2seed5optional2', 'png');

pause(0.01)