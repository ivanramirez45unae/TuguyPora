class AddDescripcionToMedicamentos < ActiveRecord::Migration[7.2]
  def change
    add_column :medicamentos, :descripcion, :string
  end
end
