class RenameDiaTableToDias < ActiveRecord::Migration[7.2]
  def change
    rename_table :dia, :dias
  end
end
