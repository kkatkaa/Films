class AddForeignKeyUsersMovies < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :movies, :users
  end
end
