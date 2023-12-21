class TrialController < ApplicationController
  def showTrialExecution
    trial = Trial.find(params[:id])
    render json: TrialExecution.where(trial_id: trial)

  end


  

end
