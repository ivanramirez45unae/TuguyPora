class CreateDonacions < ActiveRecord::Migration[7.2]
  def change
    create_table :donacions do |t|
      t.integer :user_id
      t.integer :donor_id
      t.integer :request_id
      t.integer :location_id
      t.date :fecha_donacion
      t.integer :volumen_ml
      t.string :tipo_sangre
      t.integer :verificado_por_usuario

      t.timestamps
    end
  end
end
