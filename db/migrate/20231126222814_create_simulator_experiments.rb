class CreateSimulatorExperiments < ActiveRecord::Migration[7.1]
  def change
    create_table :simulator_experiments do |t|
      t.belongs_to :simulator
      t.belongs_to :experiment
      t.timestamps
    end
  end
end
