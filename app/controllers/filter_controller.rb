class FilterController < ApplicationController
    
    def index
        @experiments=Experiment.joins(trials.tag).where(tag.name == params[:filter])
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
