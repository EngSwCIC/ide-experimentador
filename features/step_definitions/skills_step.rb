Given("that the robot has different skills in its local plan,") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
    TrialExecution.create(status: "bom", log:"0.00, [DEBUG], nurse, NURSE_CONFIG={'location': 'IC Room 6', 'position': [-33.9, 18.93, 3.14]}, None, None
    0.00, [INFO], robot5, {'battery-level': '71.80'}, None, None
    0.13, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.7179616530181877, 'battery_discharge_rate': 0.00076, 'id': 5, 'local_plan': [['navigation', ['IC Room 6', [[-13.5, 18.0, -1.57], [-13.5, 16.0], [-37.0, 16.0], [-37.0, 18.93], [-33.9, 18.93, 3.14]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-33.9, 18.93, 3.14], [-37.0, 18.93], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 7', 'name': 'r5', 'position': [-13.5, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
    0.13, [DEBUG], logger, Simulation open, None, None
    10.08, [INFO], robot5, {'y': 17.337, 'x': -13.494, 'yaw': 3.142}, None, None
    10.08, [INFO], robot5, {'battery-level': '71.11'}, None, None
    20.05, [INFO], robot5, {'battery-level': '70.35'}, None, None
    20.05, [INFO], robot5, {'y': 16.14, 'x': -14.542, 'yaw': 3.142}, None, None
    30.01, [INFO], robot5, {'battery-level': '69.59'}, None, None
    30.01, [INFO], robot5, {'y': 16.007, 'x': -16.643, 'yaw': 3.141}, None, None
    40.08, [INFO], robot5, {'y': 16.071, 'x': -18.759, 'yaw': 3.142}, None, None
    40.08, [INFO], robot5, {'battery-level': '68.83'}, None, None
    50.03, [INFO], robot5, {'y': 16.193, 'x': -20.85, 'yaw': 3.141}, None, None
    50.03, [INFO], robot5, {'battery-level': '68.07'}, None, None
    60.00, [INFO], robot5, {'battery-level': '67.31'}, None, None
    60.00, [INFO], robot5, {'y': 16.129, 'x': -22.958, 'yaw': 3.141}, None, None
    70.01, [INFO], robot5, {'battery-level': '66.55'}, None, None
    70.01, [INFO], robot5, {'y': 16.149, 'x': -25.07, 'yaw': 3.141}, None, None
    80.00, [INFO], robot5, {'battery-level': '65.79'}, None, None
    80.00, [INFO], robot5, {'y': 16.096, 'x': -27.178, 'yaw': 3.142}, None, None
    90.04, [INFO], robot5, {'y': 16.198, 'x': -29.29, 'yaw': 3.142}, None, None
    90.04, [INFO], robot5, {'battery-level': '65.03'}, None, None
    100.07, [INFO], robot5, {'battery-level': '64.27'}, None, None
    100.07, [INFO], robot5, {'y': 16.055, 'x': -31.415, 'yaw': 3.14}, None, None
    110.06, [INFO], robot5, {'battery-level': '63.51'}, None, None
    110.06, [INFO], robot5, {'y': 15.704, 'x': -33.514, 'yaw': -3.142}, None, None
    120.03, [INFO], robot5, {'y': 15.505, 'x': -35.602, 'yaw': -3.141}, None, None
    120.03, [INFO], robot5, {'battery-level': '62.75'}, None, None
    130.02, [INFO], robot5, {'battery-level': '61.99'}, None, None
    130.02, [INFO], robot5, {'y': 16.736, 'x': -36.751, 'yaw': 3.142}, None, None
    140.08, [INFO], robot5, {'battery-level': '61.23'}, None, None
    140.08, [INFO], robot5, {'y': 17.658, 'x': -36.771, 'yaw': 3.141}, None, None
    150.05, [INFO], robot5, {'battery-level': '60.47'}, None, None
    150.05, [INFO], robot5, {'y': 17.805, 'x': -35.944, 'yaw': -3.141}, None, None
    160.01, [INFO], robot5, {'y': 18.131, 'x': -35.846, 'yaw': 3.142}, None, None
    160.01, [INFO], robot5, {'battery-level': '59.71'}, None, None
    170.08, [INFO], robot5, {'battery-level': '58.95'}, None, None
    170.08, [INFO], robot5, {'y': 18.155, 'x': -35.822, 'yaw': -3.142}, None, None
    180.09, [INFO], robot5, {'y': 18.398, 'x': -35.719, 'yaw': 3.136}, None, None
    180.09, [INFO], robot5, {'battery-level': '58.19'}, None, None
    190.00, [INFO], robot5, {'battery-level': '57.43'}, None, None
    190.00, [INFO], robot5, {'y': 18.398, 'x': -35.718, 'yaw': 3.136}, None, None
    200.02, [INFO], robot5, {'battery-level': '56.67'}, None, None
    200.02, [INFO], robot5, {'y': 18.398, 'x': -35.718, 'yaw': 3.136}, None, None
    210.03, [INFO], robot5, {'battery-level': '55.91'}, None, None
    210.03, [INFO], robot5, {'y': 18.398, 'x': -35.718, 'yaw': 3.136}, None, None
    220.02, [INFO], robot5, {'battery-level': '55.15'}, None, None
    220.02, [INFO], robot5, {'y': 18.329, 'x': -35.645, 'yaw': 3.139}, None, None
    224.46, [WARN], robot5, SKILL-FAILURE, navigation, navto_room", trial_id: Trial.find_by(id: "1").id)
end

And ("the progress of the plan depends on the success of each skill,") do
    # Yes!
end

Then("it must be informed which of the robot's skills failed.") do
    visit '/graph/skillsGet/1'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include([{"time" => 224.46, "message" => "Skill navigation failed."}])
end

Given ("that a robot is selected for skills data visualization,") do
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

And ("this robot has no skills assigned,") do
    # Yes!
end

Then ("the interface should indicate that there are no skills available for the robot.") do
    visit '/graph/skillsGet/1'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include([{"time" => 46.90, "message" => "Experiment failed with NO-SKILL: authenticate_person."}])
end

Given ("that there is a local plan with the 'navigation' skill,") do
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

And ("the 'parameter' field is filled in with the room and the destination waypoints,") do
    # [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]]
end

And ("the 'skill' field, within the 'local_plan' field, must be filled in with 'navigation'") do
    # [['navigation', ['IC Room 6', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 18.93], [-33.9, 18.93, 3.14]]]
end

Then ("the robot must navigate towards the location.") do
    visit '/graph/skillsGet/1'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include([{"time" => 10.05,"message" => "Navigation to room"}])
end

Given ("that message is being sent,") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
    TrialExecution.create(status: "bom", log:"0.19, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.5779176354739738, 'battery_discharge_rate': 0.0006000000000000001, 'id': 2, 'local_plan': [['navigation', ['PC Room 3', [[-21.0, 18.0, -1.57], [-21.0, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 5', 'name': 'r2', 'position': [-21.0, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
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

And ("the status of the message should, if successful, be received,") do
    # 74.05, [info], nurse, sync, wait-message, (status=message-received)
end

Then ("the interface should indicate that the message was sent.") do
    visit '/graph/skillsGet/1'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include([{"time" => 74.05, "message" => "Message sent to nurse"}])
end

Given ("that robot approached nurse,") do
    Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
    TrialExecution.create(status: "bom", log:"0.19, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.5779176354739738, 'battery_discharge_rate': 0.0006000000000000001, 'id': 2, 'local_plan': [['navigation', ['PC Room 3', [[-21.0, 18.0, -1.57], [-21.0, 16.0], [-28.5, 16.0], [-28.5, 18.0, -1.57]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-28.5, 18.0, -1.57], [-28.5, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 5', 'name': 'r2', 'position': [-21.0, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None
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

And ("it must send a message to the person in question,") do
    # 74.05, [info], nurse, sync, received-request, (status=sending-request)
end

And ("the 'skill' field in 'local_plan' must be filled in with 'send_message',") do
    # ['send_message', ['nurse']
end

Then ("the message must being sent.") do
    visit '/graph/skillsGet/1'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include([{"time" => 74.05,"message" => "Sending message to nurse"}])
end

