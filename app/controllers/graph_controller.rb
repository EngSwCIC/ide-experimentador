require 'json'

class GraphController < ApplicationController
    def jsonGet
        file_path = Rails.root.join('analyze_skills', 'data.json')
        if File.exist?(file_path)
            puts "File found at #{file_path}"
            json_data = JSON.parse(File.read(file_path))
            render json: json_data
        
        else
        render plain: 'JSON file not found'
        end
    end
end