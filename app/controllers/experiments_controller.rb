#Essa classe representa a manipulação dos experimentos cadastrados
class ExperimentsController < ApplicationController
    #Retorna todos os experimentos cadastrados para a realização da filtragem no código da página
    def index
        @experiments = Experiment.all
    end
end
