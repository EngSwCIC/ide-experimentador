require 'faker'

# Exemplo: criando 10 simuladores fictícios
10.times do
  Simulator.new(
    name: "Simulator1",
    disabled: false
  )
end


10.times do
  Experiment.new(
    name: "Experiments1",
    disabled: false
  )
end
count = 0
10.times do
  count+=1
  SimulatorExperiment.new(
    simulator_id: 1,
    experiment_id: count
  )
end
# Apagar exemplos do banco de dados
# Simulator.where(disabled: false).destroy_all
