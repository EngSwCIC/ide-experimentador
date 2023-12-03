class VelocityController < ApplicationController
  def graph
    #@teste = "teste"
  end
  def getData
    render json: params[:id]
  end
end
