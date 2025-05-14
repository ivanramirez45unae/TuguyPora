class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :nombre, :string
    add_column :users, :nombredeusuario, :string
    add_column :users, :rol, :string
    add_column :users, :num_telefono, :string
    add_column :users, :fec_nacimiento, :date
    add_column :users, :direccion, :string
    add_column :users, :genero, :string
  end
end
