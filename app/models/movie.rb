class Movie < ActiveRecord::Base
  attr_accessible :image_url, :last_seen, :rt_description, :rt_rating, :rt_title, :title
end
