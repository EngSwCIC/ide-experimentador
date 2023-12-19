  ##
  # Controladora de simuladores
  # Neste arquivo estão definidos os métodos de CRUD de simuladores,
  # além disso, há um método para ativar/desativar um simulador.
  # A ideia é que o usuário possa configurar o ambiente de simulação de acordo com suas necessidades.
  # A ideia é é futuramente transformar essa controladora em uma API para retornar jsons em resposta às requisições
  # do front-end.
  ##


class SimulatorsController < ApplicationController
  ##
  # a. Renderiza a página de simuladores
  # b. Não há argumentos
  # c. O método apenas renderiza todos os simuladores cadastrados no banco de dados.
  # d. Os registros de simuladores são buscados por meio do método all da classe Simulator. Não há alterações no banco de dados.
  ##

  def index
    @simulators = Simulator.all
  end
  ##
  # a. Ativa/desativa um simulador
  # b. Os argumentos são passados via params. O argumento é o id do simulador.
  # c. Se o simulador for ativado/desativado com sucesso, redireciona para a página de simuladores.
  # d. O método toggle chama o update! da classe Simulator. Este método é responsável por atualizar o simulador no banco de dados.
  ##
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

  ##
  # a. Renderiza a página de criação de simuladores
  # b. Não há argumentos
  # c. O método cria uma nova instância de simulador e renderiza a página de criação de simuladores.
  # d. O método não tem efeitos colaterais.
  ##
  def new
    @simulator = Simulator.new
    render :new
  end
  ##
  # a. Deleta um simulador
  # b. Os argumentos são passados via params. O argumento é o id do simulador.
  # c. Se o simulador for deletado com sucesso, redireciona para a página de simuladores e exibe uma mensagem de sucesso.
  # Caso contrário, renderiza a página de simuladores e exibe uma mensagem de erro.
  # d. O método destroy é chamado quando o usuário clica no botão de deletar simulador na página de simuladores.
  # Este método é responsável por deletar o simulador no banco de dados.
  ##
  def destroy
    @simulator = Simulator.find(params[:id])
    if @simulator.destroy
      redirect_to simulators_path
      flash[:success] = "Simulador deletado com sucesso!"
    else
      flash.now[:error] = "Erro ao deletar simulador!"
    end
  end

  ##
  # a. Cria um simulador
  # b. Os argumentos são passados via params. O argumento é o nome do simulador.
  # c. Se o simulador for criado com sucesso, redireciona para a página de simuladores e exibe uma mensagem de sucesso.
  # Caso contrário, renderiza a página de criação de simuladores e exibe uma mensagem de erro.
  # d. O método create é chamado quando o usuário clica no botão de criar simulador na página de criação de simuladores.
  # Este método é responsável por criar o simulador no banco de dados.
  ##
  def create


    @simulator = Simulator.create(name: params[:simulator][:name], disabled:true)
    if @simulator.save
      redirect_to simulators_url
      flash[:success] = "Simulador criado com sucesso!"
    else
      flash.now[:error] = "Erro ao cadastrar simulador!"
      render :new
    end
  end

  ##
  # a. Deleta um simulador
  # b. Os argumentos são passados via params. O argumento é o id do simulador.
  # c. Se o simulador for deletado com sucesso, redireciona para a página de simuladores e exibe uma mensagem de sucesso.
  # Caso contrário, renderiza a página de simuladores e exibe uma mensagem de erro.
  # d. O método delete é chamado quando o usuário clica no botão de deletar simulador na página de simuladores.
  # Este método é responsável por deletar o simulador no banco de dados.
  ##
  def delete
    @simulator = Simulator.find(params[:id])
    if @simulator.delete
      flash[:success] = "Simulador deletado com sucesso!"
      redirect_to simulators_url
    else
      flash.now[:error] = "Erro ao deletar simulador!"
    end
  end
  ##
  # a. Renderiza a lista de experimentos relacionados ao simulador
  # b. Os argumentos são passados via params. O argumento é o id do simulador.
  # c. O método encontra todos os experimentos relacionados a determinado simulador por meio da tabela de relacionamento
  # entre simuladores e experimentos. O método retorna uma lista de experimentos.
  # d. O método não tem efeitos colaterais.
  ##
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
