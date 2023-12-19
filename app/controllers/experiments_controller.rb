class ExperimentsController < ApplicationController
    
    def index
        @experiments = Experiment.all
        
    end
    def show
        @experiment = Experiment.find(params[:id])
    end

    def new
        @experiment = Experiment.new
    end

    def create
        @experiment = Experiment.new(experiment_params)
        if @experiment.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def experiment_params
        params.require(:experiment).permit(:name)
    end

    def search
        @experiments = Experiment.where("name LIKE ?", "%#{params['search']}%")
    end
    
end
