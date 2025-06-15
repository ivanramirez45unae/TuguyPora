class AddUserToUbicacion < ActiveRecord::Migration[7.2]
  def change
    add_reference :ubicaciones, :user, foreign_key: true
  end
end
