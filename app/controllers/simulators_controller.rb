class SimulatorsController < ApplicationController
  def index
    @simulators = Simulator.all
  end
  def toggle
    @simulator = Simulator.find(params[:id])
    if @simulator.disabled?
      @simulator.update!(disabled: false)
      redirect_to simulators_path
    else
      @simulator.update!(disabled: true)
      redirect_to simulators_path
    end
  end

    #redirect_to simulators_path
  

  def show
    id = params[:id]
    teste = SimulatorExperiment.all
    @simulator = Simulator.find(id=id)
    all_experiments = SimulatorExperiment.where(simulator_id:id)
    @experiments = all_experiments.map { |exp| Experiment.find(exp.experiment_id) }
  end

  private
  def simulator_params
    params.require(:simulator).permit(:name, :disabled)
  end
end
