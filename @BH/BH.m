%Author: Fernando San Gabriel

classdef BH
	properties

		% Definicion del problema
		nVar;          % Numero de variables
        varMin;        % Minimo Límite de las variables de entrada
        varMax;        % Límite superior de las variables de entrada

        % Parametros de BH
        numOfStars; % numero de estrellas (soluciones)
        maxIter;    % Maximo numero de interaciones
    end

    methods
	    function blackHole = BH(numOfVar, lowerBound, higherBound, numOfStars,maxIter)
	    	blackHole.nVar = numOfVar;
	    	blackHole.varMin = lowerBound;
	    	blackHole.varMax = higherBound;
	    	blackHole.numOfStars = numOfStars;
            blackHole.maxIter = maxIter;
	    end

	    [blackHole, bestSolution, bestCost, allBestCost] = BH_Function(blackHole)

	    Y = ObjectiveFunction(V);
	end
end