class AddImagenToUbicaciones < ActiveRecord::Migration[7.2]
  def change
    add_column :ubicaciones, :imagen, :string
  end
end
