class AddForeignKeyUsersMovies2 < ActiveRecord::Migration[5.2]
  def change
     add_reference :movies, :users, foreign_key: true
  end
end
