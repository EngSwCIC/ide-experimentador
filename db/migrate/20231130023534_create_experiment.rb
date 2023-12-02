class CreateExperiment < ActiveRecord::Migration[7.1]
  def change
    create_table :experiments do |t|
      t.string :name
      t.boolean :disabled

      t.timestamps
    end
  end
end
