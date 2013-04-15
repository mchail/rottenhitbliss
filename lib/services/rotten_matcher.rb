module RottenMatcher
	extend self

	def match_unmatched
		Movie.where(rt_title: nil).each do |movie|
			match_movie(movie)
		end
	end

	def match_movie(movie)
		matches = search(movie)
		add_match(movie, matches['movies'].first)
	end

	def add_match(movie, rt)
		if rt.nil?
			return
		end
		movie.update_attributes(
			rt_year: rt[:year],
			rt_rating: rt[:mpaa_rating],
			rt_title: rt[:title],
			rt_description: rt[:synopsis],
			rt_runtime: rt[:runtime],
			rt_critics_rating: rt[:ratings][:critics_score],
			rt_audience_rating: rt[:ratings][:audience_score]
		)
	end

	def search(movie)
		response = RestClient.get(search_url(movie.title))
		JSON.parse(response).with_indifferent_access
	end

	def search_url(q)
		"http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=t7fqrh5wc5nwcjenhvjstse9&q=#{URI.encode(q)}&page_limit=1"
	end
end
