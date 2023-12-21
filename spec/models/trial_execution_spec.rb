# require 'rails_helper'
require_relative '../../app/models/trial_execution.rb'

RSpec.describe TrialResult do
  describe '#initialize' do
    context 'quando os dados são válidos' do
      let(:valid_data) do
          double('TrialResult', status: 'success', log: "{'battery-level':'50','x':1,'y':1,'x':2,'y':2,'battery-level':25}")
      end

      it 'inicializa corretamente os atributos' do
        trial_result = TrialResult.new(valid_data)

        expect(trial_result.status).to eq('success')
        expect(trial_result.position_x).to eq('2')
        expect(trial_result.position_y).to eq('2')
        expect(trial_result.battery).to eq('25')
      end

      it 'define position_x, position_y e battery como "-" quando o log não contém valores' do
        no_data_log = double('TrialResult', status: 'success', log: "{}")
        trial_result = TrialResult.new(no_data_log)

        expect(trial_result.position_x).to eq('-')
        expect(trial_result.position_y).to eq('-')
        expect(trial_result.battery).to eq('-')
      end
    end

    context 'quando os dados são inválidos' do
      let(:invalid_data) { double('TrialResult', status: nil, log: nil) }

      it 'define status como "N/A"' do
        trial_result = TrialResult.new(invalid_data)

        expect(trial_result.status).to eq('N/A')
      end

      it 'define position_x, position_y e battery como "-" quando o log é vazio' do
        trial_result = TrialResult.new(invalid_data)

        expect(trial_result.position_x).to eq('-')
        expect(trial_result.position_y).to eq('-')
        expect(trial_result.battery).to eq('-')
      end

      it 'define status como "N/A" e position_x, position_y e battery como "-" quando status é vazio' do
        invalid_status_data = double('TrialResult', status: '', log: nil)
        trial_result = TrialResult.new(invalid_status_data)

        expect(trial_result.status).to eq('N/A')
        expect(trial_result.position_x).to eq('-')
        expect(trial_result.position_y).to eq('-')
        expect(trial_result.battery).to eq('-')
      end
    end
  end
end