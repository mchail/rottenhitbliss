class Movie < ActiveRecord::Base
  attr_accessible :image_url, :last_seen, :rt_description, :rt_rating,
  	:rt_title, :title, :rt_runtime, :rt_critics_rating, :rt_audience_rating,
  	:rt_year

  	scope :best, order('rt_critics_rating DESC')
end
