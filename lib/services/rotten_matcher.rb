module RottenMatcher
	extend self


	def match
		Movie.where(rt_title: nil).each do |movie|
			match_movie movie
		end
	end

	def match_movie

	end

	def search_url(q)
		"http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=t7fqrh5wc5nwcjenhvjstse9&q=#{q}&page_limit=1"
	end
end
