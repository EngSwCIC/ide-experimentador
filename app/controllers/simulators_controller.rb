class SimulatorsController < ApplicationController
  before_action :set_simulator, only: [:toggle]
  def index
    @simulators = Simulator.all
  end

  def toggle
    if params[:state] == 'activate'
      @simulator.update(disabled: false)
    elsif params[:state] == 'deactivate'
      @simulator.update(disabled: true)
    end

    redirect_to simulators_path
  end

  def show
    id = params[:id]
    teste = SimulatorExperiment.all
    @simulator = Simulator.find(id=id)
    all_experiments = SimulatorExperiment.where(simulator_id:id)
    @experiments = all_experiments.map { |exp| Experiment.find(exp.experiment_id) }
  end

  private
  def set_simulator
    @simulator = Simulator.find(params[:id])
  end
end
