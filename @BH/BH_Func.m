function [blackHole, bestSolution, blackHoleCost, allBestCost] = BH_Func(blackHole)
%% Initialization
% Inicializar una población de estrellas con ubicaciones aleatorias en el espacio de búsqueda.
locationOfStars = repmat(blackHole.varMin ,blackHole.numOfStars,1)...
    + repmat(blackHole.varMax - blackHole.varMin ,blackHole.numOfStars,1).*rand(blackHole.numOfStars,blackHole.nVar);
% Matriz para mantener el mejor valor de coste en cada iteración
allBestCost = zeros(blackHole.maxIter,1);
%% Main Loop of BH
for iter = 1:blackHole.maxIter
    
    % Evaluacion
    starsCost = ObjectiveFunc(locationOfStars);
    
    % Selección de la Mejor Estrella que tenga el mejor valor de aptitud como Agujero Negro
    [blackHoleCost, BH_ind] = max(starsCost);
    
    % Cambia la ubicación de cada estrella y calcula nuevos valores fitness
    locationOfStars = locationOfStars +  (repmat(locationOfStars(BH_ind),blackHole.numOfStars,blackHole.nVar) - locationOfStars)...
        .*unifrnd(0,1,blackHole.numOfStars,blackHole.nVar);
    starsCost = ObjectiveFunc(locationOfStars);
    
    % Si hay una estrella que alcanza una ubicación con menor coste que el agujero negro, intercambia sus ubicaciones
    if blackHoleCost < max(starsCost)
        [blackHoleCost, BH_ind] = max(starsCost);
    end
    % almacenar el mejor valor de coste
    allBestCost(iter) = blackHoleCost;
    if iter<blackHole.maxIter
        % Calcular el radio del horizonte de sucesos del agujero negro
        R = blackHoleCost / sum(starsCost);
        distances = (sqrt(sum(locationOfStars-repmat(locationOfStars(BH_ind),blackHole.numOfStars,blackHole.nVar),2).^2))';
        crosserStarsInd = find(distances<R);
        if length(crosserStarsInd)>0
            for i=1:length(crosserStarsInd)
                locationOfStars(crosserStarsInd(i),:) = unifrnd(0,1,blackHole.nVar,1);
            end
        end
    end
end
bestSolution = locationOfStars(BH_ind,:);
disp(['BH_index is' num2str(BH_ind)]);
end