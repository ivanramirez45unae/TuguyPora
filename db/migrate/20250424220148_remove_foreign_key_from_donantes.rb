class RemoveForeignKeyFromDonantes < ActiveRecord::Migration[7.2]
  def change
    # Especifica el nombre de la columna (user_id)
    # y la tabla referenciada (users)
    remove_foreign_key :donantes, column: :user_id
  end
end
