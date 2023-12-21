# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Experiment.create([ name: "teste", disabled: false ])
    Trial.create([name: "testeTrial", disabled: false, deleted: false, runs: 20, experiment_id: Experiment.find_by(id: "1").id])
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

