class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :tytuł
      t.string :rok_produkcji
      t.string :czas_trwania
      t.text :opis

      t.timestamps
    end
  end
end
