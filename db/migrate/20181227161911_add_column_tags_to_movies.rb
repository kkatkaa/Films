class AddColumnTagsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :tags, :text, array: true, default: []
  end
end
