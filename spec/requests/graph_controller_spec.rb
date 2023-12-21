require 'rails_helper.rb'

RSpec.describe "GraphController", type: :request do
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 99, log: "0.00, [DEBUG], nurse, NURSE_CONFIG={'location': 'PC Room 3', 'position': [-28.5, 18.0, -1.57]}, None, None
    0.00, [INFO], robot2, {'battery-level': '63.50'}, None, None
    0.11, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.634952869577942, 'battery_discharge_rate': 0.00054, 'id': 2, 'local_plan': [['navigation', ['PC Room 3', [[-21.0, 18.0, -1.57], [-21.0, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 5', 'name': 'r2', 'position': [-21.0, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
    0.11, [DEBUG], logger, Simulation open, None, None
    10.07, [INFO], robot2, {'y': 17.977, 'x': -20.956, 'yaw': -3.141}, None, None
    10.07, [INFO], robot2, {'battery-level': '63.01'}, None, None
    20.01, [INFO], robot2, {'battery-level': '62.47'}, None, None
    20.01, [INFO], robot2, {'y': 16.197, 'x': -21.448, 'yaw': 3.141}, None, None
    30.05, [INFO], robot2, {'battery-level': '61.93'}, None, None
    30.05, [INFO], robot2, {'y': 16.101, 'x': -23.573, 'yaw': 3.141}, None, None
    40.01, [INFO], robot2, {'battery-level': '61.39'}, None, None
    40.01, [INFO], robot2, {'y': 16.087, 'x': -25.671, 'yaw': 3.141}, None, None
    50.01, [INFO], robot2, {'battery-level': '60.85'}, None, None
    50.01, [INFO], robot2, {'y': 16.095, 'x': -27.778, 'yaw': -3.139}, None, None
    60.06, [INFO], robot2, {'battery-level': '60.31'}, None, None
    60.06, [INFO], robot2, {'y': 17.701, 'x': -28.627, 'yaw': 3.142}, None, None
    70.02, [INFO], robot2, {'battery-level': '59.77'}, None, None
    70.02, [INFO], robot2, {'y': 17.975, 'x': -28.622, 'yaw': -3.142}, None, None
    73.92, [info], nurse, sync, received-request, (status=sending-request)
    73.92, [info], nurse, sync, request-sent, (status=waiting)
    73.92, [info], nurse, sync, wait-message, (status=message-received)
    80.03, [INFO], robot2, {'battery-level': '59.23'}, None, None
    80.03, [INFO], robot2, {'y': 16.913, 'x': -28.699, 'yaw': 3.139}, None, None
    89.94, [INFO], robot2, {'battery-level': '58.69'}, None, None
    90.03, [INFO], robot2, {'y': 16.168, 'x': -27.158, 'yaw': 3.142}, None, None
    100.05, [INFO], robot2, {'y': 14.855, 'x': -25.881, 'yaw': -3.142}, None, None
    100.05, [INFO], robot2, {'battery-level': '58.15'}, None, None
    110.03, [INFO], robot2, {'battery-level': '57.61'}, None, None
    110.03, [INFO], robot2, {'y': 13.027, 'x': -25.904, 'yaw': 3.141}, None, None
    118.29, [info], lab_arm, sync, wait-message, (status=message-received)
    119.17, [WARN], robot2, SUCCESS, None, None"}) }


    before do
    allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
      get "/graph/skillsGet/99"
    end

    it "Acessa graph/skillsGet" do
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET graph#skillsGet" do
    # Se nao existe linha com local plan, nao captura skill
    let(:trial_execution) { instance_double(TrialExecution, {id: 98, log: "[WARN], logger, TIMEOUT, None, None"  })}

    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
        get "/graph/skillsGet/98"
      end
    
    it 'Erro: sem iniciação do local_plan' do
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([])
    end
  end

  # Necessita-se de uma linha com local plan para se identificar as proximas skills
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 97, log: "0.20, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 6', [[-39.44, 33.95, 0.0], [-37.0, 33.95], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93],
    [WARN], logger, TIMEOUT, None, None" })}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Existe local_plan e msg de TIMEOUT' do
      get '/graph/skillsGet/97'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{ "message" => "TIMEOUT" }])
    end
  end

  # Msg de Start
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 96, log:  "0.11, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 2', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 21.5], [-38.0, 21.5, 0.0]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 6', 'name': 'r6', 'position': [-33.9, 18.93, 3.14], 'skills': ['approach_person', 'approach_robot', 'navigation', 'operate_drawer']}, None, None
      0.11, [DEBUG], logger, Simulation open, None, None"} )}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Comando de start' do
      get '/graph/skillsGet/96'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{ "message" => "Experiment started!"}])
    end
  end

  # Msg de Navigation to room + Falta de skill
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 95, log: "0.11, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 2', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 21.5], [-38.0, 21.5, 0.0]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 6', 'name': 'r6', 'position': [-33.9, 18.93, 3.14], 'skills': ['approach_person', 'approach_robot', 'navigation', 'operate_drawer']}, None, None
      0.11, [DEBUG], logger, Simulation open, None, None
      10.03, [INFO], robot6, {'y': 18.858, 'x': -33.903, 'yaw': -3.141}, None, None
      10.03, [INFO], robot6, {'battery-level': '53.44'}, None, None
      55.48, [WARN], robot6, NO-SKILL, authenticate_person, authenticate_nurse"})}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Navigation to room + Falta de skill' do
      get '/graph/skillsGet/95'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"}, {"time" => 10.03,"message" => "Navigation to room"}, {"time" => 10.03,"message" => "Navigation to room"}, {"time" => 55.48,"message" => "Experiment failed with NO-SKILL: authenticate_person."}])
    end
  end

  # Msg de falha em skill
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 94, log: "0.19, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 2', 'name': 'r3', 'position': [-38.0, 21.5, 0.0], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
      0.19, [DEBUG], logger, Simulation open, None, None
      176.81, [WARN], robot3, SKILL-FAILURE, navigation, navto_lab"})}
        
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Falha em skill' do
      get '/graph/skillsGet/94'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"}, {"time" => "176.81","message" => "Skill navigation failed."}])
    end
  end

  # Msg de envio para enfermeira
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 93, log: "0.19, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 2', 'name': 'r3', 'position': [-38.0, 21.5, 0.0], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
      0.19, [DEBUG], logger, Simulation open, None, None
      68.58, [info], nurse, sync, received-request, (status=sending-request)
      68.58, [info], nurse, sync, request-sent, (status=waiting)
      68.58, [info], nurse, sync, wait-message, (status=message-received)"})}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Envio de mensagem - enfermeira' do
      get '/graph/skillsGet/93'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"}, {"time" => 68.58,"message" => "Sending message to nurse"},{"time" => 68.58,"message" => "Waiting the message get to nurse"},{"time" => 68.58,"message" => "Message sent to nurse"}])
    end
  end

  # Msg de Navigation to lab + envio para lab_arm
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 92, log:  "0.19, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 2', 'name': 'r3', 'position': [-38.0, 21.5, 0.0], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
      0.19, [DEBUG], logger, Simulation open, None, None
      10.01, [INFO], robot4, {'battery-level': '64.70'}, None, None
      10.01, [INFO], robot4, {'y': 34.241, 'x': -33.519, 'yaw': 3.142}, None, None
      108.75, [info], nurse, sync, received-request, (status=sending-request)
      108.75, [info], nurse, sync, request-sent, (status=waiting)
      108.75, [info], nurse, sync, wait-message, (status=message-received)
      110.04, [INFO], robot4, {'battery-level': '59.10'}, None, None
      110.04, [INFO], robot4, {'y': 21.387, 'x': -38.117, 'yaw': 3.139}, None, None
      210.62, [info], lab_arm, sync, wait-message, (status=message-received)"})}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Navigation to lab + lab_arm' do
      get '/graph/skillsGet/92'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"}, {"time" => 10.01,"message" => "Navigation to room"},{"time" => 10.01,"message" => "Navigation to room"}, {"time" => 108.75,"message" => "Sending message to nurse"},{"time" => 108.75,"message" => "Waiting the message get to nurse"},{"time" => 108.75,"message" => "Message sent to nurse"}, {"time" => 110.04,"message" => "Navigation to lab"}, {"time" => 110.04,"message" => "Navigation to lab"}, {"time" => 210.62,"message" => "Message sent to lab_arm"}])
    end
  end

  # Msg de Sucesso!
  describe "GET graph#skillsGet" do
    let(:trial_execution) { instance_double(TrialExecution, {id: 91, log:  "0.13, [DEBUG], logger, ROBOTS_CONFIG={'local_plan': [['navigation', ['PC Room 3', [[-27.23, 18.0, -1.57], [-27.23, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 4', 'name': 'r6', 'position': [-27.23, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
      0.13, [DEBUG], logger, Simulation open, None, None
      81.78, [WARN], robot6, SUCCESS, None, None"})}
      
    before do
      allow(TrialExecution).to receive(:find_by).with(id: trial_execution.id.to_s).and_return(trial_execution)
    end

    it 'Sucesso!' do
      get '/graph/skillsGet/91'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"}, {"time" => 81.78,"message" => "Experiment completed successfully with 81.78 seconds!"}])
    end
  end
end
