class CreateDonantesCondiciones < ActiveRecord::Migration[7.2]
  def change
    create_table :donantes_condiciones do |t|
      t.integer :donor_id, null: false
      t.integer :condition_id, null: false

      t.timestamps
    end
  end
end
