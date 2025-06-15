class AddPostulacionIdToDonaciones < ActiveRecord::Migration[7.2]
  def change
    add_reference :donaciones, :postulacion, null: false, foreign_key: true
  end
end
