class SimulatorsController < ApplicationController
  def index
    @simulators = Simulator.all
  end

end
