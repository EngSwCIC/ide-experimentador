class BatteryController < ApplicationController

    def index
        testes = Trial.all

        bateria = params[:b]

        if testes.any?

            @ligacoes = TrialFactor.all

            lista_de_testes_para_execucao = []
            lista_de_baterias_por_indice = []

            @ligacoes.each do |ligacao|

                nome_do_experimento = ligacao.trial.experiment.name
                nome_do_teste = ligacao.trial.name
                nome_do_fator = ligacao.factor.name
                valor_bateria = ligacao.factor.value
                
                if ['carga', 'Carga'].include?(nome_do_fator)

                    if !lista_de_testes_para_execucao.any? { |lista| lista[0] == nome_do_experimento && lista[1] == nome_do_teste }
                        lista_de_testes_para_execucao << [nome_do_experimento, nome_do_teste]
                        lista_de_baterias_por_indice << [valor_bateria]
                
                    end
                end
            end
            #puts "Experimentos e Testes: #{lista_de_testes_para_execucao}"
            #puts "Baterias relacionadas aos testes: #{lista_de_baterias_por_indice}"
        else
            puts 'Não existem testes cadastrados'
        end
    end
end


[['Experimento 1',  'Teste 5']['Experimento 1',  'Teste 1']['Experimento 3', 'Teste 2']['Experimento 1',  'Teste 3']]
[['Corrida', 'Ciência'], ['Lixo', 'Ciência'], ['Picolé', 'Ciência'], ['Corrida', 'Geladinho']]

[['Experimento 1',  'Teste 5']['Experimento 1',  'Teste 1']['Experimento 3', 'Teste 2']['Experimento 2',  'Teste 3']]
[[], [], ['X','Y','Z']]




