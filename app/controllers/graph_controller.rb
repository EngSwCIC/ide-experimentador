require 'json'

class GraphController < ApplicationController
    def jsonGet
        filePath = '././logs/9_aaaccb.log'
        File.open(filePath, 'r') do |file|
            started = false                 # boolean pra controle de quando começa o experimento
            finished = false                # boolean pra controle de quando termina o experimento
        
            isNav = true                    # boolean para controle de destino da navigation
            navigationList = []             # guarda info das linhas de navigation
        
            json_data = []
            
            def navigationLine(navigation, navigationList, json_data)      # referente à linha de navigation
                time = navigation[1].to_f
                print time
                puts " Navigation #{navigationList[0]}"
                json_data << { "time" => time, "message" => "Navigation #{navigationList[0]}"}
            end
                
            def messageLine(linhaLista, json_data)                         # referente à linha de mensagem
                time = linhaLista[0]
                case
                when linhaLista[5] == '(status=sending-request)'        # request de mensagem
                    print time
                    puts " Sending message to #{linhaLista[2]}"
                    json_data << { "time" => time, "message" => "Sending message to #{linhaLista[2]}"}
                
                when linhaLista[5] == '(status=waiting)'                # espera de mensagem
                    print time
                    puts " Waiting the message get to #{linhaLista[2]}"
                    json_data << { "time" => time, "message" => "Waiting the message get to #{linhaLista[2]}"}
        
                when linhaLista[5] == '(status=message-received)'       # mensagem recebida
                    print time
                    puts " Message sent to #{linhaLista[2]}"
                    json_data << { "time" => time, "message" => "Message sent to #{linhaLista[2]}"}
                
                else
                    puts '?'
                end
            end
        
            def successLine(linhaLista, json_data)
                time = linhaLista[0]
                puts "Experiment completed successfully with #{time} seconds!"
                json_data << { "message" => "Experiment completed successfully with #{time} seconds!"}
            end
        
            def failureLine(linhaLista, json_data)
                time = linhaLista[0]
                case linhaLista[3]
                when 'NO-SKILL'
                    print time
                    puts " Experiment failed with #{linhaLista[3]}: #{linhaLista[4]}."
                    json_data << { "time" => time, "message" => "Experiment failed with #{linhaLista[3]}: #{linhaLista[4]}."}
        
                when 'SKILL-FAILURE'
                    print time
                    puts " Skill #{linhaLista[4]} failed."
                    json_data << { "time" => time, "message" => "Skill #{linhaLista[4]} failed."}
        
                end
            end
        
            file.each_line do |line|
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
                        puts 'TIMEOUT'
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
                    failure =  line.match(/(\d+\.\d+), \[WARN\], (\w+), SKILL-FAILURE, (\w+)/) || line.match(/(\d+\.\d+), \[WARN\], (\w+), NO-SKILL, (\w+)/)
        
        
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
                            puts "TIMEOUT"
                            json_data << { "message" => "TIMEOUT"}
                        end
        
                    when start
                        started = true
                        puts 'Experiment started!'
                        json_data << { "message" => "Experiment started!"}
                    
                    else                                        # se não for nada disso daí é ota coisa.
                        puts '??'
                    end
        
                    
                end
            end

            jsonString = JSON.generate(json_data)
            render json: jsonString
        end
    end
end