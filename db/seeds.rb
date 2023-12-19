require 'faker'

# Gerando 10 simuladores
count = 0
10.times do
  count+=1
  Simulator.create!(
    name: "Simulator ##{count}",
    disabled: false
  )
end
# Gerando 10 experimentos
count = 0
10.times do
  count += 1
  Experiment.create!(
    name: "Experiment ##{count}",
    disabled: false
  )
end
# gerando 10 tabelas de relacionamento entre simuladores e experimentos
count = 0
10.times do
  count+=1
  SimulatorExperiment.create!(
      simulator_id: count,
      experiment_id: count

  )
end
