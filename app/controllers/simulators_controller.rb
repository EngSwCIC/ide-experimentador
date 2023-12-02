class SimulatorsController < ApplicationController
  def index
    @simulators = Simulator.all
  end

  def show
    id = params[:id]
    teste = SimulatorExperiment.all
    all_experiments = SimulatorExperiment.where(simulator_id:id)
    @experiments = all_experiments.map { |exp| Experiment.find(exp.experiment_id) }
  end
end
