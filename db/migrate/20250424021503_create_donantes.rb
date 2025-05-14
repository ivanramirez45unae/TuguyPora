class CreateDonantes < ActiveRecord::Migration[7.2]
  def change
    create_table :donantes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tipo_sanguineo
      t.float :peso_kg
      t.float :estatura_cm
      t.boolean :tiene_tatuajes
      t.date :ult_donacion_fecha
      t.boolean :ult_donacion_verificado

      t.timestamps
    end
  end
end
