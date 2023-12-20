class ExperimentsController < ApplicationController
    def show
      @oneExperiment = Experiment.find(params[:id])
    end
    
    def index 
      
    end

    def showAll
      render json: Experiment.all()
    end

    def listAllTrials
      experiment = Experiment.find(params[:id])
      render json: Trial.where(experiment_id: experiment)
    end
  
  end
  