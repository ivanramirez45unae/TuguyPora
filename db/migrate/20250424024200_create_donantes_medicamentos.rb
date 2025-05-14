class CreateDonantesMedicamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :donantes_medicamentos do |t|
      t.integer :donor_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
