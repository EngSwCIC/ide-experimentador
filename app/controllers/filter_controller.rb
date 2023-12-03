class FilterController < ApplicationController
    
    def index
        #filtros = filter_params
        #listaResposta = []
        #for e in Experiment.all do
        #    listaAux = []
        #    for c in Classification.all do
        #        if Trial.find(id: c.trial_id).experiment_id == e.id
        #            if Tag.find(id: c.tag_id) in filtros
        #                listaAux << Tag.find(id: c.tag_id)
        #            end
        #        end
        #    end
        #    if listaAux.sort == filtros.sort
        #        listaResposta << e
        #    end
        #end
        #@experiments = listaResposta

        parametros = "%#{params[:filter]}%"
        if parametros == []
            @experiments = Experiment.all
        else
            @experiments = Experiment.where(name:parametros)
        end
        
    end
    
    def show 
    end

    def new
        @experiment = Experiment.new
    end

    def create
        @experiment = Experiment.new(experiment_params)
    end


    private
        # Use callbacks to share common setup or constraints between actions.
        def set_experiment
        @experiment = Experiment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def experiment_params
        params.require(:experiment).permit(:name,boolean)
        end
end
