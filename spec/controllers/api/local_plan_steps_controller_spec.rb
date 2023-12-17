require 'rails_helper'

describe Api::LocalPlanStepsController, type: :controller do
    describe '/GET #index' do
        it 'return status OK' do
            get :index_by_robot, params: { robot_id: 'some_id' }
            expect(response).to have_http_status(:ok)
        end
    end
    describe '/GET #create' do
        let!(:robot) {Robot.create!()}
        let!(:local_plan_steps_params) do
            {stepNumber:10, label:"teste", parameters: "teste", skill:"test", robot_id: robot.id}
        end
        context 'should create a plan with good params' do
            it 'return status created' do
                get :create, params: {local_plan_steps: local_plan_steps_params}
                    expect(response).to have_http_status(:created)
                    expect(LocalPlanStep.count).to change_by(1) 
            end
        end
        context 'should create a plan with bad params' do
            it 'return status bad_request' do
                local_plan_steps_params = nil
                get :create , params: {local_plan_steps: local_plan_steps_params}
                expect(response).to have_http_status(:bad_request)
            end
        end
    end
    describe 'DELETE #delete' do
    let!(:robot) {Robot.create!()}
    let!(:local_plan_step) { LocalPlanStep.create!(stepNumber: 1, label: 'Exemplo', parameters: 'Parâmetros', skill:"test", robot_id: robot.id) }
    it 'delete a local plan' do
      delete :delete, params: { id: local_plan_step.id }
      expect(response).to have_http_status(:ok)
    end

    it 'return error if local plan dont exist' do
      delete :delete, params: { id: nil }
      expect(response).to have_http_status(:not_found)
    end
  end
  
  describe 'PATCH #update' do
    let!(:robot) {Robot.create!()}
    let!(:local_plan_step) { LocalPlanStep.create!(stepNumber: 1, label: 'Exemplo', parameters: 'Parâmetros', skill:"test", robot_id: robot.id) }

    it 'Update a local plan' do
      updated_params = { label: 'Novo Label' }

      patch :update, params: { id: local_plan_step.id, local_plan_steps: updated_params }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['label']).to eq('Novo Label')
    end

    it 'return a error if local_plan_step dont exist' do
      patch :update, params: { id: nil , local_plan_steps: { label: 'Novo Label' } }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns error if update fails' do
      allow_any_instance_of(LocalPlanStep).to receive(:update!).and_raise(ActiveRecord::RecordInvalid.new(LocalPlanStep.new))
      patch :update, params: { id: local_plan_step.id, local_plan_steps: { label: 'Novo Label' } }
      expect(response).to have_http_status(:bad_request)
    end
  end
end