class AddBoxToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :box, :string
  end
end
