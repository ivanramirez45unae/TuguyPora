class CreateDonantesCondiciones < ActiveRecord::Migration[7.2]
  def change
    create_table :donantes_condiciones do |t|
      t.references :donante, null: false, foreign_key: true
      t.references :condicion_cronica, null: false, foreign_key: true

      t.timestamps
    end
  end
end

