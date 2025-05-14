class CreateDia < ActiveRecord::Migration[7.2]
  def change
    create_table :dia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
