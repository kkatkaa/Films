class AddUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :user
  end
end
