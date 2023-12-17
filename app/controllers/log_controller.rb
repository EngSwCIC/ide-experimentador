class LogController < ApplicationController
    skip_forgery_protection
    def index
        render
    end    

    def get_all
        x = TrialExecution.where(trial_id: 2).order(created_at: :desc)
        render json: x[0]
    end

end