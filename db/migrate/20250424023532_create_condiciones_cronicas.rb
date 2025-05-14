class CreateCondicionesCronicas < ActiveRecord::Migration[7.2]
  def change
    create_table :condiciones_cronicas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
