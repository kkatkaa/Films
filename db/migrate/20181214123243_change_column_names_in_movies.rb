class ChangeColumnNamesInMovies < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :tytuł, :title
    rename_column :movies, :rok_produkcji, :year
    rename_column :movies, :reżyseria, :director
    rename_column :movies, :scenariusz, :writer
    rename_column :movies, :gatunek, :genre
    rename_column :movies, :czas_trwania, :duration
    rename_column :movies, :opis, :description
  end
end
