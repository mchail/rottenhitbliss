class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image_url
      t.date :last_seen
      t.string :rt_title
      t.text :rt_description
      t.integer :rt_rating

      t.timestamps
    end
  end
end
