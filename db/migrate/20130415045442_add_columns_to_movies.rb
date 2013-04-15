class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rt_audience_rating, :integer
    add_column :movies, :rt_year, :integer
    add_column :movies, :rt_critics_rating, :integer
    add_column :movies, :rt_runtime, :integer
  end
end
