desc "Retrieves all movies from hitbliss"
task :crawl_movies => :environment do
	HitblissCrawler.crawl
	RottenMatcher.match
end
