require 'json'

class GraphController < ApplicationController
    # Recebe um experimento do banco de dados,
    # recolhe o log e retorna json com skills executadas.
    def skillsGet
        test_id = params[:id]   # pega id da url referente ao log
        @trials = TrialExecution.find_by(id: test_id)
        started = false                 # boolean pra controle de quando começa o experimento
        finished = false                # boolean pra controle de quando termina o experimento
    
        isNav = true                    # boolean para controle de destino da navigation
        navigationList = []             # guarda info das linhas de navigation
    
        json_data = []
        json_id = []

        # Identifica linha de navegação ("navigation") e bota no json ("json_data")
        # "navigationList" é uma lista identificativa do destino (room ou lab)
        #
        #   "10.06, [INFO], robot6, {'y': 18.901, 'x': -33.896, 'yaw': -3.141}, None, None"
        #   # => { "time" => 10.06, "message" => Navigation to room}
        def navigationLine(navigation, navigationList, json_data)      # referente à linha de navigation
            time = navigation[1].to_f
            json_data << { "time" => time, "message" => "Navigation #{navigationList[0]}"}
        end
        
        # Identifica linha de envio/espera de mensagem ("linhaLista") e bota no json (json_data)
        #
        #   "86.29, [info], nurse, sync, received-request, (status=sending-request)"
        #   # => { "time" => 86.29, "message" => Sending message to nurse}
        #
        #   "86.29, [info], nurse, sync, request-sent, (status=waiting)"
        #   # => { "time" => 86.29, "message" => Waiting the message get to nurse}
        #
        #   "86.29, [info], nurse, sync, wait-message, (status=message-received)"
        #   # => { "time" => 86.29, "message" => Message sent to nurse}
        def messageLine(linhaLista, json_data)                         # referente à linha de mensagem
            time = linhaLista[0]
            case
            when linhaLista[5] == '(status=sending-request)'        # request de mensagem
                json_data << { "time" => time, "message" => "Sending message to #{linhaLista[2]}"}
            
            when linhaLista[5] == '(status=waiting)'                # espera de mensagem
                json_data << { "time" => time, "message" => "Waiting the message get to #{linhaLista[2]}"}

            when linhaLista[5] == '(status=message-received)'       # mensagem recebida
                json_data << { "time" => time, "message" => "Message sent to #{linhaLista[2]}"}
            
            else
                 
            end
        end

        # Identifica linha de sucesso ("linhaLista") e bota no json ("json_data")
        #
        #   "161.70, [WARN], robot6, SUCCESS, None, None"
        #   # => { "time" => 161.70, "message" => Experiment completed successfully with 161.70 seconds!}
        def successLine(linhaLista, json_data)
            time = linhaLista[0]
            puts "Experiment completed successfully with #{time} seconds!"
            json_data << { "time" => time, "message" => "Experiment completed successfully with #{time} seconds!"}
        end
        
        # Identifica linha de falha ("linhaLista") e bota no json ("json_data")
        # 
        #   "42.00, [WARN], robot6, NO-SKILL, authenticate_person, authenticate_nurse"
        #   # => { "time" => 42.00, "message" => Experiment failed with NO-SKILL: authenticate_person!}
        #
        #   "281.18, [WARN], robot5, SKILL-FAILURE, navigation, navto_room"
        #   # => { "time" => 281.18, "message" => Skill navigation failed.}
        #
        #   "49.07, [WARN], robot3, LOWBATT, None, None"
        #   # => { "time" => 49.07, "message" => Battery is low.}
        def failureLine(linhaLista, json_data)
            time = linhaLista[0]
            case linhaLista[3]
            when 'NO-SKILL'
                json_data << { "time" => time, "message" => "Experiment failed with #{linhaLista[3]}: #{linhaLista[4]}."}

            when 'SKILL-FAILURE'
                json_data << { "time" => time, "message" => "Skill #{linhaLista[4]} failed."}
                
            when 'LOWBATT'
                json_data << { "time" => time, "message" => "Battery is low."}
            end
        end

        lines = @trials.log.split("\n") # separa cada linha do log

        lines.each do |line|
            linhaLista = line.split(',').map(&:strip)

            if line.include?('ROBOTS_CONFIG')
                # posição inicial e final do hash ROBOTS_CONFIG
                startIndex = line.index("ROBOTS_CONFIG={")
                endIndex = line.index("}", startIndex)
                robotsConfigStr = line[startIndex..endIndex]

                # substitui aspas simples por aspas duplas
                robotsConfigStr.gsub!("'", "\"")

                # remove "ROBOTS_CONFIG=" e analisa-se como JSON
                begin
                    robotsConfigJson = robotsConfigStr.sub("ROBOTS_CONFIG=", "")
                    robotsConfigHash = JSON.parse(robotsConfigJson)
                rescue
                    json_data << { "message" => "TIMEOUT"}
                    break
                end

                localPlan = robotsConfigHash['local_plan']

                c = 0
                localPlan.each do |action|
                    c += 1
                    if action[0] == 'navigation'

                        case
                        when action[2] == 'navto_room'
                            navigationList.append('to room')
                            
                        when action[2] == 'navto_lab'
                            navigationList.append('to lab')
                            
                        else
                            navigationList.append('to X')
                        end

                    end
                end

            else 
                # montando padrões de linha
                start = line.match(/(\d+\.\d+), \[DEBUG\], logger, Simulation open, (\w+), (\w+)/) || line.match(/(\d+\.\d+), \[INFO\], (\w+), {'y': (-?\d+\.\d+), 'x': (-?\d+\.\d+), 'yaw': (-?\d+\.\d+)}, (\w+), (\w+)/)
                # === #
                navigation = line.match(/(\d+\.\d+), \[INFO\], (\w+), {'battery-level': '(\d+\.\d+)'}, (\w+), (\w+)/) || line.match(/(\d+\.\d+), \[INFO\], (\w+), {'y': (-?\d+\.\d+), 'x': (-?\d+\.\d+), 'yaw': (-?\d+\.\d+)}, (\w+), (\w+)/)
                # === #
                message = line.match(/(\d+\.\d+), \[info\], (\w+)/)
                # === #
                success = line.match(/(\d+\.\d+), \[WARN\], (\w+), SUCCESS, (\w+)/)
                # === #
                timeout = line.match(/\[WARN\], logger, TIMEOUT, (\w+)/)
                # === #
                failure =  line.match(/(\d+\.\d+), \[WARN\], (\w+), SKILL-FAILURE, (\w+)/) || line.match(/(\d+\.\d+), \[WARN\], (\w+), NO-SKILL, (\w+)/) || line.match(/(\d+\.\d+), \[WARN\], (\w+), LOWBATT, (\w+)/)
                # === #
                

                case
                when navigation && started == true          # caso a linha seja de navigation
                    if !isNav
                        navigationList.delete_at(0)
                    end
                    isNav = true
                    navigationLine(navigation, navigationList, json_data)

                when !navigation && started == true         # caso a linha não seja de navigation
                    isNav = false
                    if message                              # se não for navigation, pode ser de mensagem
                        messageLine(linhaLista, json_data)
                    end

                    if success  
                        successLine(linhaLista, json_data)
                    end

                    if failure
                        failureLine(linhaLista, json_data)
                    end

                    if timeout
                        json_data << { "message" => "TIMEOUT"}
                    end

                when start
                    started = true
                    json_data << { "message" => "Experiment started!"}
                
                end
            end
        end
        
        
        if @trials
            jsonString = JSON.generate(json_data)
            render json: jsonString
        end

    end
end
