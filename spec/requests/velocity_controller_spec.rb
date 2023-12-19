require 'rails_helper.rb'

RSpec.describe "VelocityController", type: :request do
  describe "GET velocity#getData" do
    it "Acessa velocity/getData/:id" do
      get velocity_getData_path
      expect(response).to have_http_status(200)
    end
  end

  
  describe "GET velocity#getData" do
    let(:file_content) {"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None;
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None;
    19.99, [INFO], robot4, {'battery-level': '17.00'}, None, None;
    19.99, [INFO], robot4, {'y': 33.238, 'x': -37.019, 'yaw': 3.141}, None, None;
    30.01, [INFO], robot4, {'battery-level': '16.74'}, None, None;
    30.01, [INFO], robot4, {'y': 31.112, 'x': -37.069, 'yaw': 3.141}, None, None;
    39.97, [INFO], robot4, {'y': 28.987, 'x': -37.012, 'yaw': 3.14}, None, None;
    39.97, [INFO], robot4, {'battery-level': '16.48'}, None, None;
    49.98, [INFO], robot4, {'battery-level': '16.22'}, None, None;
    50.01, [INFO], robot4, {'y': 26.87, 'x': -37.012, 'yaw': 3.142}, None, None;
    60.02, [INFO], robot4, {'battery-level': '15.96'}, None, None;
    60.02, [INFO], robot4, {'y': 24.742, 'x': -37.047, 'yaw': 3.142}, None, None;
    69.98, [INFO], robot4, {'y': 22.63, 'x': -37.066, 'yaw': 3.141}, None, None;
    70.00, [INFO], robot4, {'battery-level': '15.70'}, None, None;
    79.99, [INFO], robot4, {'battery-level': '15.44'}, None, None;
    79.99, [INFO], robot4, {'y': 20.504, 'x': -37.147, 'yaw': 3.142}, None, None;
    90.02, [INFO], robot4, {'y': 18.53, 'x': -36.598, 'yaw': 3.141}, None, None;
    90.02, [INFO], robot4, {'battery-level': '15.18'}, None, None;
    100.01, [INFO], robot4, {'battery-level': '14.92'}, None, None;
    100.01, [INFO], robot4, {'y': 17.763, 'x': -34.786, 'yaw': -3.142}, None, None;
    109.99, [INFO], robot4, {'y': 18.934, 'x': -33.913, 'yaw': 3.142}, None, None;
    109.99, [INFO], robot4, {'battery-level': '14.66'}, None, None;
    113.74, [info], nurse, sync, received-request, (status=sending-request);
    113.74, [info], nurse, sync, request-sent, (status=waiting);
    113.75, [info], nurse, sync, wait-message, (status=message-received);
    120.00, [INFO], robot4, {'y': 18.079, 'x': -34.685, 'yaw': -3.142}, None, None;
    120.00, [INFO], robot4, {'battery-level': '14.40'}, None, None;
    129.99, [INFO], robot4, {'battery-level': '14.14'}, None, None;
    130.00, [INFO], robot4, {'y': 18.038, 'x': -36.106, 'yaw': -3.142}, None, None;
    140.02, [INFO], robot4, {'battery-level': '13.88'}, None, None;
    140.02, [INFO], robot4, {'y': 18.081, 'x': -36.168, 'yaw': 3.142}, None, None;
    149.98, [INFO], robot4, {'y': 17.575, 'x': -37.036, 'yaw': 3.142}, None, None;
    149.98, [INFO], robot4, {'battery-level': '13.62'}, None, None;
    160.01, [INFO], robot4, {'y': 17.345, 'x': -36.954, 'yaw': -3.141}, None, None;
    160.01, [INFO], robot4, {'battery-level': '13.36'}, None, None;
    170.01, [INFO], robot4, {'y': 17.274, 'x': -37.095, 'yaw': -3.141}, None, None;
    170.01, [INFO], robot4, {'battery-level': '13.10'}, None, None;
    179.97, [INFO], robot4, {'battery-level': '12.84'}, None, None;
    180.00, [INFO], robot4, {'y': 17.402, 'x': -37.034, 'yaw': -3.142}, None, None;
    190.01, [INFO], robot4, {'y': 17.205, 'x': -36.812, 'yaw': -3.141}, None, None;
    190.01, [INFO], robot4, {'battery-level': '12.58'}, None, None;
    200.02, [INFO], robot4, {'battery-level': '12.32'}, None, None;
    200.02, [INFO], robot4, {'y': 17.363, 'x': -36.885, 'yaw': 3.142}, None, None;
    210.01, [INFO], robot4, {'y': 17.131, 'x': -37.113, 'yaw': 3.142}, None, None;
    210.01, [INFO], robot4, {'battery-level': '12.06'}, None, None".split(';') } 

    before do
      allow(File).to receive(:open).and_yield(StringIO.new(file_content))
    end
    
    it 'Resposta correta' do
      get '/velocity/getData/1'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response).to eq([{"message" => "Experiment started!"},{"time" => 10.01,"message" => "Navigation to room"},{"time" => 10.01,"message" => "Navigation to room"},{"time" => 20.07,"message" => "Navigation to room"},{"time" => 20.07,"message" => "Navigation to room"},{"time" => 30.03,"message" => "Navigation to room"},{"time" => 30.03,"message" => "Navigation to room"},{"time" => "37.37","message" => "Sending message to nurse"},{"time" => "37.37","message" => "Waiting the message get to nurse"},{"time" => "37.37","message" => "Message sent to nurse"},{"time" => 40.04,"message" => "Navigation to lab"},{"time" => 40.04,"message" => "Navigation to lab"},{"time" => 50.0,"message" => "Navigation to lab"},{"time" => 50.0,"message" => "Navigation to lab"},{"time" => 60.09,"message" => "Navigation to lab"},{"time" => 60.09,"message" => "Navigation to lab"},{"time" => 70.02,"message" => "Navigation to lab"},{"time" => 70.02,"message" => "Navigation to lab"},{"time" => 80.03,"message" => "Navigation to lab"},{"time" => 80.03,"message" => "Navigation to lab"},{"time" => "80.86","message" => "Message sent to lab_arm"},{"time" => "81.78","message" => "Experiment completed successfully with 81.78 seconds!"}])
    end
  end