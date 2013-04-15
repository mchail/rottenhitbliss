module HitblissCrawler
	extend self

	HITBLISS_MOVIE_URL = "http://www.hitbliss.com/movies/all/all/Title/"

	def crawl
		puts "crawling Hitbliss"
		page_index = 1
		begin
			puts "getting page #{page_index}"
			page = get_page page_index
			unless page.nil?
				process_page page
			end
			page_index += 1
		end until page.nil?
	end

	def get_page(n)
		agent.get("#{HITBLISS_MOVIE_URL}#{n}.html")
	rescue
		return nil
	end

	def process_page(page)
		page.search('ul.catalog li').each do |record|
			process_movie(record)
		end
	end

	def process_movie(record)
		link = record.search(:a).first
		image = record.search(:img).first
		title = link.attr(:title)
		image_url = image.attr(:src)
		movie = Movie.find_or_create_by_title(title)
		movie.update_attributes(
			image_url: image_url,
			last_seen: Time.zone.today
		)
	end

	def agent
		@agent ||= Mechanize.new
	end
end
