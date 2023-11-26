class CreateSimulators < ActiveRecord::Migration[7.1]
  def change
    create_table :simulators do |t|
      t.string :name
      t.boolean :disabled
      t.timestamps
    end
  end
end
