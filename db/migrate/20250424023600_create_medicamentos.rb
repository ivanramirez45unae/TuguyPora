class CreateMedicamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :medicamentos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
