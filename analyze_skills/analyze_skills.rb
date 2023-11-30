require 'json'
filePath = 'analyze_skills/50_abcbbp.log'

=begin logLine = "0.20, [DEBUG], logger, ROBOTS_CONFIG={'avg_speed': 0.15, 'battery_charge': 0.634952869577942, 'battery_discharge_rate': 0.00026000000000000003, 'id': 2, 'local_plan': [['navigation', ['IC Room 2', [[-19.0, 18.0, -1.57], [-19.0, 16.0], [-37.0, 16.0], [-37.0, 21.5], [-38.0, 21.5, 0.0]]], 'navto_room'], ['approach_person', ['nurse'], 'approach_nurse'], ['authenticate_person', ['nurse'], 'authenticate_nurse'], ['operate_drawer', ['open'], 'open_drawer_for_nurse'], ['send_message', ['nurse'], 'notify_nurse_of_open_drawer_for_nurse_completed'], ['wait_message', ['nurse'], 'wait_nurse_to_complete_deposit'], ['operate_drawer', ['close'], 'close_drawer_nurse'], ['navigation', ['Laboratory', [[-38.0, 21.5, 0.0], [-37.0, 21.5], [-37.0, 16.0], [-26.0, 16.0], [-26.0, 13.0, 1.57]]], 'navto_lab'], ['approach_robot', ['lab_arm'], 'approach_arm'], ['operate_drawer', ['open'], 'open_drawer_lab'], ['send_message', ['lab_arm'], 'notify_lab_arm_of_open_drawer_lab_completed'], ['wait_message', ['lab_arm'], 'wait_lab_arm_to_complete_pick_up_sample'], ['operate_drawer', ['close'], 'close_drawer_lab']], 'location': 'PC Room 6', 'name': 'r2', 'position': [-19.0, 18.0, -1.57], 'skills': ['approach_person', 'approach_robot', 'authenticate_person', 'navigation', 'operate_drawer']}, None, None"
=end

File.open(filePath, 'r') do |file|
    started = false                 # boolean pra controle de quando começa as skills
    navigationList = []
    nav = true                      # boolean para controle de destino da navegation

    file.each_line do |line|
        if line.include?('ROBOTS_CONFIG')
            # posição inicial e final do hash ROBOTS_CONFIG
            startIndex = line.index("ROBOTS_CONFIG={")
            endIndex = line.index("}", startIndex)
            robotsConfigStr = line[startIndex..endIndex]

            # substitui aspas simples por aspas duplas
            robotsConfigStr.gsub!("'", "\"")

            # remove "ROBOTS_CONFIG=" e analisa-se como JSON
            robotsConfigJson = robotsConfigStr.sub("ROBOTS_CONFIG=", "")
            robotsConfigHash = JSON.parse(robotsConfigJson)

            localPlan = robotsConfigHash['local_plan']

            c = 0
            localPlan.each do |action|
                    c += 1
                    if action[0] == 'navigation'
                        if action[2] == 'navto_room'
                            navigationList.append('to room')
                        end

                        if action[2] == 'navto_lab'
                            navigationList.append('to lab')
                        end
                    end
                end
        else 
            
            start = line.match(/(\d+\.\d+), \[DEBUG\], logger, Simulation open, (\w+), (\w+)/) || line.match(/(\d+\.\d+), \[INFO\], (\w+), {'y': (-?\d+\.\d+), 'x': (-?\d+\.\d+), 'yaw': (-?\d+\.\d+)}, (\w+), (\w+)/)
            navigation = line.match(/(\d+\.\d+), \[INFO\], (\w+), {'battery-level': '(\d+\.\d+)'}, (\w+), (\w+)/) || line.match(/(\d+\.\d+), \[INFO\], (\w+), {'y': (-?\d+\.\d+), 'x': (-?\d+\.\d+), 'yaw': (-?\d+\.\d+)}, (\w+), (\w+)/)

            if navigation && started == true
                if !nav
                    navigationList.delete_at(0)
                end

                nav = true
                time = navigation[1].to_f
                print time
                puts " Navigation #{navigationList[0]}"
            end

            if !navigation && started == true
                nav = false
                p line
            end

            if start
                started = true
            end
        end
    end 
end

