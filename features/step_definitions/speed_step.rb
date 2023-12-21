Given("that the user is on a experiment screen") do
    #do nothing
end

And ("the test was never run") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.first.id])
    #Não existe trial execution
end

When("I click on the speed button") do
    visit "/velocity/graph/1" #sempre tem id 1 por causa da maneira como o cucumber funciona
end

Then("it shouldn't be possible to view the data") do
    expect(page).to have_content("Erro")
end


And("the test was run successfully") do 
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.first.id])
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
210.01, [INFO], robot4, {'battery-level': '12.06'}, None, None", trial_id: Trial.find_by(id: "1").id)
end


Then("I should see in a graph the speed information that was collected during the test run") do
    page.should have_css('div.recharts-wrapper')
end

Then("I should see the speed information until the point of failure") do
    page.should have_css('div.recharts-wrapper')
end

Then("the application should report an error") do
    expect(page).to have_content("Erro")
end

And("the test ran successfully but with a failure") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.first.id])
    TrialExecution.create(status: "bom", log:"0.00, [INFO], robot3, {'battery-level': '8.04'}, None, None
    0.12, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.08039941318304296, 'battery_discharge_rate': 0.00064, 'id': 3, 'local_plan': [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 2', 'name': 'r3', 'position': [-38.0, 21.5, 0.0], 'skills': ['approach_person', 'approach_robot', 'navigation', 'operate_drawer']}, None, None
    0.12, [DEBUG], logger, Simulation open, None, None
    10.05, [INFO], robot3, {'y': 21.423, 'x': -37.237, 'yaw': -3.141}, None, None
    10.05, [INFO], robot3, {'battery-level': '7.46'}, None, None
    20.08, [INFO], robot3, {'y': 19.318, 'x': -37.061, 'yaw': 3.139}, None, None
    20.08, [INFO], robot3, {'battery-level': '6.82'}, None, None
    30.06, [INFO], robot3, {'battery-level': '6.18'}, None, None
    30.06, [INFO], robot3, {'y': 17.825, 'x': -35.564, 'yaw': -3.142}, None, None
    40.03, [INFO], robot3, {'battery-level': '5.54'}, None, None
    40.03, [INFO], robot3, {'y': 18.858, 'x': -34.0, 'yaw': -3.142}, None, None
    46.90, [WARN], robot3, NO-SKILL, authenticate_person, authenticate_nurse", trial_id: Trial.find_by(id: "1").id)
end

And("that the test was run but the speed information is missing") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.first.id])
    TrialExecution.create(status: "bom", trial_id: Trial.find_by(id: "1").id)
end
