# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
100.01, [INFO], robot4, {'battery-level': '14.92'}, None, None", trial_id: 7)