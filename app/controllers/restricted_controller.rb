class RestrictedController < ApplicationController
  before_action :authenticate_user!
  def world
    @texto = "teste"
  end
  def index
    render json: "pagina restrita"
  end
end