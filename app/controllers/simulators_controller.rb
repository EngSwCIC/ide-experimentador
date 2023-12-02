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





  private
  def simulator_params
    params.require(:simulator).permit(:name, :disabled)
  end

end
