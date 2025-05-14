class DropUsuarios < ActiveRecord::Migration[6.1]
  def change
    drop_table :usuarios
  end
end
