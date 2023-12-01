class SimulatorsController < ApplicationController
  def index
    @simulators = Simulator.all
  end

  def activate
    @simulator.update(disabled: false)
  end

  def deactivate
    @simulator.update(disabled: true)
  end
end
