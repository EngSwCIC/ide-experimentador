Given("that the robot has different skills in its local plan,") do
end

And ("the progress of the plan depends on the success of each skill,") do
    Experiment.create([ name: "teste", disabled: false ])
        Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
        TrialExecution.create(status: "bom", log: "0.00, [INFO], robot3, {'battery-level': '8.04'}, None, None
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

Then("it must be informed which of the robot's skills failed.") do
    visit '/graph/skills/1'
    page.should have_selector('p', text: 'Experiment failed ')
    
end

Given ("that a robot is selected for skills data visualization,") do

end

And ("this robot has no skills assigned,") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
    TrialExecution.create(status: "bom", log: "0.00, [DEBUG], nurse, NURSE_CONFIG={'location': 'PC Room 3', 'position': [-28.5, 18.0, -1.57]}, None, None
    0.00, [INFO], robot1, {'battery-level': '24.00'}, None, None
    0.19, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.23995139509475963, 'battery_discharge_rate': 0.0006600000000000001, 'id': 1, 'local_plan': [['navigation', ['PC Room 3', [[-39.44, 33.95, 0.0], [-37.0, 33.95], [-37.0, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'IC Room 4', 'name': 'r1', 'position': [-39.44, 33.95, 0.0], 'skills': ['approach_person', 'approach_robot', 'navigation', 'operate_drawer']}, None, None
    0.19, [DEBUG], logger, Simulation open, None, None", trial_id: Trial.find_by(id: "1").id)
end

Then ("the interface should indicate that there are no skills available for the robot.") do
    visit '/graph/skills/1'
    page.should have_selector('p', text: 'Experimento sem ações!')
end

Given('that a robot has a set of skills') do
end
  
Given('all skills are executed with success') do
    Experiment.create([ name: "teste", disabled: false ])
        Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
        TrialExecution.create(status: "bom", log: "0.19, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.5779176354739738, 'battery_discharge_rate': 0.0006000000000000001, 'id': 2, 'local_plan': [['navigation', ['PC Room 3', [[-21.0, 18.0, -1.57], [-21.0, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 5', 'name': 'r2', 'position': [-21.0, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
        0.19, [DEBUG], logger, Simulation open, None, None
        10.07, [INFO], robot2, {'y': 17.533, 'x': -20.967, 'yaw': 3.142}, None, None
        10.07, [INFO], robot2, {'battery-level': '57.25'}, None, None
        20.02, [INFO], robot2, {'y': 16.111, 'x': -21.741, 'yaw': -3.141}, None, None
        20.02, [INFO], robot2, {'battery-level': '56.65'}, None, None
        30.07, [INFO], robot2, {'battery-level': '56.05'}, None, None
        30.07, [INFO], robot2, {'y': 16.007, 'x': -23.865, 'yaw': 3.141}, None, None
        40.07, [INFO], robot2, {'battery-level': '55.45'}, None, None
        40.07, [INFO], robot2, {'y': 15.987, 'x': -25.987, 'yaw': 3.139}, None, None
        50.01, [INFO], robot2, {'battery-level': '54.85'}, None, None
        50.01, [INFO], robot2, {'y': 16.048, 'x': -28.101, 'yaw': 3.141}, None, None
        60.06, [INFO], robot2, {'y': 17.831, 'x': -28.598, 'yaw': 3.14}, None, None
        60.06, [INFO], robot2, {'battery-level': '54.25'}, None, None
        70.01, [INFO], robot2, {'y': 18.047, 'x': -28.577, 'yaw': 3.142}, None, None
        70.01, [INFO], robot2, {'battery-level': '53.65'}, None, None
        74.05, [info], nurse, sync, received-request, (status=sending-request)
        74.05, [info], nurse, sync, request-sent, (status=waiting)
        74.05, [info], nurse, sync, wait-message, (status=message-received)
        80.09, [INFO], robot2, {'battery-level': '53.05'}, None, None
        80.09, [INFO], robot2, {'y': 17.0, 'x': -28.698, 'yaw': 3.141}, None, None
        90.06, [INFO], robot2, {'battery-level': '52.45'}, None, None
        90.06, [INFO], robot2, {'y': 16.105, 'x': -27.307, 'yaw': -3.142}, None, None
        100.04, [INFO], robot2, {'battery-level': '51.85'}, None, None
        100.04, [INFO], robot2, {'y': 14.956, 'x': -25.939, 'yaw': 3.141}, None, None
        110.06, [INFO], robot2, {'battery-level': '51.25'}, None, None
        110.06, [INFO], robot2, {'y': 12.981, 'x': -25.854, 'yaw': 3.142}, None, None
        118.90, [info], lab_arm, sync, wait-message, (status=message-received)
        119.82, [WARN], robot2, SUCCESS, None, None", trial_id: Trial.find_by(id: "1").id)
end
  
Then('the interface should show the graph of the skills') do
    visit '/graph/skills/1'
    page.should have_selector('p', text: 'Sucesso!')
end