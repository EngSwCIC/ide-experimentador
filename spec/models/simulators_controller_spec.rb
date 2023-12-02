
require 'rails_helper'

RSpec.describe SimulatorsController, type: :controller do
  describe 'POST #toggle' do
    let!(:simulator) { Simulator.create(name: "Simulator Name", disabled: true) }


    it 'activates the simulator' do
      post :toggle, params: { id: simulator.id, state: 'activate' }
      simulator.reload
      expect(simulator.disabled).to be(false)
      expect(response).to redirect_to(simulators_path)
    end

    it 'deactivates the simulator' do
      post :toggle, params: { id: simulator.id, state: 'deactivate' }
      simulator.reload
      expect(simulator.disabled).to be(true)
      expect(response).to redirect_to(simulators_path)
    end
  end
end



