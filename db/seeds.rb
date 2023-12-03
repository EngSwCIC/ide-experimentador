require 'faker'

# Exemplo: criando 10 simuladores fictícios

count = 0
10.times do
  count+=1
  Simulator.create!(
    name: "Simulator ##{count}",
    disabled: false
  )
end

count = 0
10.times do
  count += 1
  Experiment.create!(
    name: "Experiment ##{count}",
    disabled: false
  )
end
count = 0
10.times do
  count+=1
  SimulatorExperiment.create!(
    simulator_id: 1,
    experiment_id: count
  )
end
# Apagar exemplos do banco de dados
# Simulator.where(disabled: false).destroy_all
