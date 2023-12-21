require 'json'

class VelocityController < ApplicationController
  def graph
    @teste = "teste"
  end
  
  #rota utilizada para adiquirir um JSON contendo as informações de velocidade média a cada período de tempo
  def getData
    test_id = params[:id]
    
    #Recebe o log como string e retorna um array contendo apenas as informações de posição
    def get_position_data(log_string)
      output_array = []
      log_string.split("\n").each do |line| 
        if (match = line.match(/(\d+\.\d+), \[.*?\], .*?, \{'y': (.*?), 'x': (.*?), 'yaw': (.*?)}/))
          time, y, x, yaw = match.captures
          output_array << { 'time' => time.to_f, 'y' => y.to_f, 'x' => x.to_f, 'yaw' => yaw.to_f }
        end
      end
      output_array
    end
    
    #Recebe as informações de posição e retoran um JSON contendo as velocidade médias
    def get_speed_data(positon_array)
      output_json = {}
      positon_array.each_cons(2) do |i, i_next|
        output_json[i_next["time"]] = (Math.sqrt((i_next["x"] - i["x"])**2 + (i_next["y"] - i["y"])**2)/(i_next["time"]-i["time"]))
      end
      output_json
    end

    trial = TrialExecution.find_by(id: test_id)

    if((trial == nil) || (trial.log == nil))
      render json: {}
    else
      render json: get_speed_data(get_position_data(trial.log))
    end
  end
end
