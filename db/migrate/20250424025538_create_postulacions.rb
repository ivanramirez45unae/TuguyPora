class CreatePostulacions < ActiveRecord::Migration[7.2]
  def change
    create_table :postulacions do |t|
      t.integer :user_id
      t.integer :request_id
      t.integer :location_id
      t.date :fecha_tentativa
      t.time :hora_tentativa
      t.string :estado

      t.timestamps
    end
  end
end
