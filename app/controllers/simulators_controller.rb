class SimulatorsController < ApplicationController
  def index
    @simulators = Simulator.all # página que lista todos os simuladores
  end
  def toggle
    # Botão de ativar/desativar simulador
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
    # Página de criação de simulador
    @simulator = Simulator.new
    render :new
  end
  def destroy
    # Botão de deletar simulador
    @simulator = Simulator.find(params[:id])
    if @simulator.destroy
      redirect_to simulators_path
      flash[:success] = "Simulador deletado com sucesso!"
    else
      flash.now[:error] = "Erro ao deletar simulador!"
    end
  end

  def create
    # Criação de simulador
    @simulator = Simulator.create(name: params[:simulator][:name], disabled:true)
    if @simulator.save
      redirect_to simulators_url
      flash[:success] = "Simulador criado com sucesso!"
    else
      flash.now[:error] = "Erro ao cadastrar simulador!"
      render :new
    end
  end

  def delete
    # Botão de deletar simulador
    @simulator = Simulator.find(params[:id])
    if @simulator.delete
      flash[:success] = "Simulador deletado com sucesso!"
      redirect_to simulators_url
    else
      flash.now[:error] = "Erro ao deletar simulador!"
    end
  end

  def show
    # Página de visualização de experimentos relacionados a um simulador
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
