# spec/controllers/log_controller_spec.rb

require 'rails_helper'

RSpec.describe LogController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #get_all' do
  before(:each) do
    experimentos = Experiment.create([ name: "teste", disabled: false ])
    trial = Trial.create([name: "teste", disabled: false, deleted: false, runs: 20, experiment_id: experimentos.first.id])
    TrialExecution.create(status: "bom", log:"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None
    ", trial_id: trial.first.id) 
    
    TrialExecution.create(status: "bom", log:"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None
    ", trial_id: trial.first.id) 

    trial = Trial.create([name: "teste", disabled: false, deleted: false, runs: 20, experiment_id: experimentos.first.id])

    TrialExecution.create(status: "bom", log:"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None
    ", trial_id: trial.first.id)
  end

    it 'should get the logs of the last experiment' do
      get :get_all

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')

      json_response = JSON.parse(response.body)
      
      expect(json_response[0]['trial_id']).to eq(1) 
      expect(json_response[0]['id']).to eq(2) 
      expect(json_response[1]['trial_id']).to eq(2) 
      expect(json_response[1]['id']).to eq(3) 
    end
  end
end