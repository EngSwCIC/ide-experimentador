Before do
    experimentos = Experiment.create([ name: "teste", disabled: false ])
    trial = Trial.create([name: "teste", disabled: false, deleted: false, runs: 20, experiment_id: experimentos.first.id])
    trial_executions = TrialExecution.create(status: "bom", log:"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None
    19.99, [INFO], robot4, {'battery-level': '17.00'}, None, None
    19.99, [INFO], robot4, {'y': 33.238, 'x': -37.019, 'yaw': 3.141}, None, None
    30.01, [INFO], robot4, {'battery-level': '16.74'}, None, None
    30.01, [INFO], robot4, {'y': 31.112, 'x': -37.069, 'yaw': 3.141}, None, None
    39.97, [INFO], robot4, {'y': 28.987, 'x': -37.012, 'yaw': 3.14}, None, None
    39.97, [INFO], robot4, {'battery-level': '16.48'}, None, None
    49.98, [INFO], robot4, {'battery-level': '16.22'}, None, None
    50.01, [INFO], robot4, {'y': 26.87, 'x': -37.012, 'yaw': 3.142}, None, None
    60.02, [INFO], robot4, {'battery-level': '15.96'}, None, None
    60.02, [INFO], robot4, {'y': 24.742, 'x': -37.047, 'yaw': 3.142}, None, None
    69.98, [INFO], robot4, {'y': 22.63, 'x': -37.066, 'yaw': 3.141}, None, None
    70.00, [INFO], robot4, {'battery-level': '15.70'}, None, None
    79.99, [INFO], robot4, {'battery-level': '15.44'}, None, None
    79.99, [INFO], robot4, {'y': 20.504, 'x': -37.147, 'yaw': 3.142}, None, None
    90.02, [INFO], robot4, {'y': 18.53, 'x': -36.598, 'yaw': 3.141}, None, None
    90.02, [INFO], robot4, {'battery-level': '15.18'}, None, None
    100.01, [INFO], robot4, {'battery-level': '14.92'}, None, None
    100.01, [INFO], robot4, {'y': 17.763, 'x': -34.786, 'yaw': -3.142}, None, None
    109.99, [INFO], robot4, {'y': 18.934, 'x': -33.913, 'yaw': 3.142}, None, None
    109.99, [INFO], robot4, {'battery-level': '14.66'}, None, None
    113.74, [info], nurse, sync, received-request, (status=sending-request)
    113.74, [info], nurse, sync, request-sent, (status=waiting)
    113.75, [info], nurse, sync, wait-message, (status=message-received)
    120.00, [INFO], robot4, {'y': 18.079, 'x': -34.685, 'yaw': -3.142}, None, None
    120.00, [INFO], robot4, {'battery-level': '14.40'}, None, None
    129.99, [INFO], robot4, {'battery-level': '14.14'}, None, None
    130.00, [INFO], robot4, {'y': 18.038, 'x': -36.106, 'yaw': -3.142}, None, None
    140.02, [INFO], robot4, {'battery-level': '13.88'}, None, None
    140.02, [INFO], robot4, {'y': 18.081, 'x': -36.168, 'yaw': 3.142}, None, None
    149.98, [INFO], robot4, {'y': 17.575, 'x': -37.036, 'yaw': 3.142}, None, None
    149.98, [INFO], robot4, {'battery-level': '13.62'}, None, None
    160.01, [INFO], robot4, {'y': 17.345, 'x': -36.954, 'yaw': -3.141}, None, None
    160.01, [INFO], robot4, {'battery-level': '13.36'}, None, None
    170.01, [INFO], robot4, {'y': 17.274, 'x': -37.095, 'yaw': -3.141}, None, None
    170.01, [INFO], robot4, {'battery-level': '13.10'}, None, None
    179.97, [INFO], robot4, {'battery-level': '12.84'}, None, None
    180.00, [INFO], robot4, {'y': 17.402, 'x': -37.034, 'yaw': -3.142}, None, None
    190.01, [INFO], robot4, {'y': 17.205, 'x': -36.812, 'yaw': -3.141}, None, None
    190.01, [INFO], robot4, {'battery-level': '12.58'}, None, None
    200.02, [INFO], robot4, {'battery-level': '12.32'}, None, None
    200.02, [INFO], robot4, {'y': 17.363, 'x': -36.885, 'yaw': 3.142}, None, None
    210.01, [INFO], robot4, {'y': 17.131, 'x': -37.113, 'yaw': 3.142}, None, None
    210.01, [INFO], robot4, {'battery-level': '12.06'}, None, None", trial_id: trial.first.id) 
    
    TrialExecution.create(status: "bom", log:"10.02, [INFO], robot4, {'battery-level': '17.26'}, None, None
    10.02, [INFO], robot4, {'y': 34.57, 'x': -38.121, 'yaw': -3.142}, None, None
    19.99, [INFO], robot4, {'battery-level': '17.00'}, None, None
    19.99, [INFO], robot4, {'y': 33.238, 'x': -37.019, 'yaw': 3.141}, None, None
    30.01, [INFO], robot4, {'battery-level': '16.74'}, None, None
    30.01, [INFO], robot4, {'y': 31.112, 'x': -37.069, 'yaw': 3.141}, None, None
    39.97, [INFO], robot4, {'y': 28.987, 'x': -37.012, 'yaw': 3.14}, None, None
    39.97, [INFO], robot4, {'battery-level': '16.48'}, None, None
    49.98, [INFO], robot4, {'battery-level': '16.22'}, None, None
    50.01, [INFO], robot4, {'y': 26.87, 'x': -37.012, 'yaw': 3.142}, None, None
    60.02, [INFO], robot4, {'battery-level': '15.96'}, None, None
    60.02, [INFO], robot4, {'y': 24.742, 'x': -37.047, 'yaw': 3.142}, None, None
    69.98, [INFO], robot4, {'y': 22.63, 'x': -37.066, 'yaw': 3.141}, None, None
    70.00, [INFO], robot4, {'battery-level': '15.70'}, None, None
    79.99, [INFO], robot4, {'battery-level': '15.44'}, None, None
    79.99, [INFO], robot4, {'y': 20.504, 'x': -37.147, 'yaw': 3.142}, None, None
    90.02, [INFO], robot4, {'y': 18.53, 'x': -36.598, 'yaw': 3.141}, None, None
    90.02, [INFO], robot4, {'battery-level': '15.18'}, None, None
    100.01, [INFO], robot4, {'battery-level': '14.92'}, None, None
    100.01, [INFO], robot4, {'y': 17.763, 'x': -34.786, 'yaw': -3.142}, None, None
    109.99, [INFO], robot4, {'y': 18.934, 'x': -33.913, 'yaw': 3.142}, None, None
    109.99, [INFO], robot4, {'battery-level': '14.66'}, None, None
    113.74, [info], nurse, sync, received-request, (status=sending-request)
    113.74, [info], nurse, sync, request-sent, (status=waiting)
    113.75, [info], nurse, sync, wait-message, (status=message-received)
    120.00, [INFO], robot4, {'y': 18.079, 'x': -34.685, 'yaw': -3.142}, None, None
    120.00, [INFO], robot4, {'battery-level': '14.40'}, None, None
    129.99, [INFO], robot4, {'battery-level': '14.14'}, None, None
    130.00, [INFO], robot4, {'y': 18.038, 'x': -36.106, 'yaw': -3.142}, None, None
    140.02, [INFO], robot4, {'battery-level': '13.88'}, None, None
    140.02, [INFO], robot4, {'y': 18.081, 'x': -36.168, 'yaw': 3.142}, None, None
    149.98, [INFO], robot4, {'y': 17.575, 'x': -37.036, 'yaw': 3.142}, None, None
    149.98, [INFO], robot4, {'battery-level': '13.62'}, None, None
    160.01, [INFO], robot4, {'y': 17.345, 'x': -36.954, 'yaw': -3.141}, None, None
    160.01, [INFO], robot4, {'battery-level': '13.36'}, None, None
    170.01, [INFO], robot4, {'y': 17.274, 'x': -37.095, 'yaw': -3.141}, None, None
    170.01, [INFO], robot4, {'battery-level': '13.10'}, None, None
    179.97, [INFO], robot4, {'battery-level': '12.84'}, None, None
    180.00, [INFO], robot4, {'y': 17.402, 'x': -37.034, 'yaw': -3.142}, None, None
    190.01, [INFO], robot4, {'y': 17.205, 'x': -36.812, 'yaw': -3.141}, None, None
    190.01, [INFO], robot4, {'battery-level': '12.58'}, None, None
    200.02, [INFO], robot4, {'battery-level': '12.32'}, None, None
    200.02, [INFO], robot4, {'y': 17.363, 'x': -36.885, 'yaw': 3.142}, None, None
    210.01, [INFO], robot4, {'y': 17.131, 'x': -37.113, 'yaw': 3.142}, None, None
    210.01, [INFO], robot4, {'battery-level': '12.06'}, None, None", trial_id: trial.first.id) 
  end

When ('o usuario estiver na tela de visualizar nivel de bateria') do
    visit '/battery/index'
end

Given ('que o usuario clique no formulario de busca e escreva um valor fora do escopo de tempo, como {string}') do |string|
    fill_in 'battery_input', with: string
end


Then ('o usuario deveria ver uma mensagem dizendo {string}') do |string|
    assert_selector 'p', text: string
end


Given ('que o usuario clique no formulario de busca e escreva um valor usando caracteres não numéricos, como {string}') do |string|
    fill_in 'battery_input', with: string
end


Given ('que eu solicite o status da bateria usando dados validos') do
    fill_in 'battery_input', with: '19.99'
end

Then ('eu deveria ver a porcentagem da bateria correspondente desse instante') do
    assert_selector 'td', text: "1"
    assert_selector 'td', text: "19.99"
end

Given ("que eu solicite o status da bateria de um trial valido usando um tempo validos") do
    fill_in 'battery_input', with: '19.99'
    fill_in 'trial_input', with: '1'
end


