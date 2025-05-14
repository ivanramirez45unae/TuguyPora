class CreateHorarios < ActiveRecord::Migration[7.2]
  def change
    create_table :horarios do |t|
      t.integer :location_id
      t.integer :day_id
      t.time :abre_a
      t.time :cierra_a

      t.timestamps
    end
  end
end
