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

  def new
    @simulator = Simulator.new
    render :new
  end
  def destroy
    @simulator = Simulator.find(params[:id])
    if @simulator.destroy
      redirect_to simulators_path
    end
  end

  def create
    @simulator = Simulator.create(name: params[:simulator][:name], disabled:true)
    if @simulator.save
      flash[:success] = "Simulador adicionado com sucesso!"
      redirect_to simulators_url, notice: "Simulador adicionado com sucesso!"
    else
      flash.now[:error] = "Simulador com erro"
      render :new
    end
  end

  def delete
    @simulator = Simulator.find(params[:id])
    if @simulator.delete
      redirect_to simulators_path
    end
  end

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
