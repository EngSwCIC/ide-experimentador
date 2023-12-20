class AddExperiments < ActiveRecord::Migration[7.1]
  def up
  Experiment.create(name: "Experiment 1", disabled: true)
  Experiment.create(name: "Experiment 2", disabled: true)
  Experiment.create(name: "Experiment 3", disabled: false)
  Experiment.create(name: "Experiment 4", disabled: false)
  Experiment.create(name: "Experiment 5", disabled: false)
  Experiment.create(name: "Experiment 6", disabled: false)
  end
  def down
  end
end
