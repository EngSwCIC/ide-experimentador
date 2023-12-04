require 'json'

class VelocityController < ApplicationController
  def graph
    @teste = "teste"
  end
  def getData

    # isso é temporario
    # porque os banco de dados estão vazios
    # isso está uzando os logs de exemplo


    #a ideia é extrair o log do bd quando ele estiver disponivel
    log_file_path = './analyze_skills/logs/2_aaaabp.log'


    json_array = []
    json_saida = {}

    # Read from the file and process each line
    File.foreach(log_file_path) do |line|
      if (match = line.match(/(\d+\.\d+), \[.*?\], .*?, \{'y': (.*?), 'x': (.*?), 'yaw': (.*?)}/))
        time, y, x, yaw = match.captures
        json_array << { 'time' => time.to_f, 'y' => y.to_f, 'x' => x.to_f, 'yaw' => yaw.to_f }
      end
    end

    json_array.each_cons(2) do |i, i_next|
      json_saida[i_next["time"]] = (Math.sqrt((i_next["x"] - i["x"])**2 + (i_next["y"] - i["y"])**2)/(i_next["time"]-i["time"]))
    end

    render json: json_saida
  end
end
