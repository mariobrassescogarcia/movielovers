require "sinatra"
require "sinatra/reloader"
require "pry"
require "imdb"




get "/" do 
	erb(:home)	
end



get "/results" do
	@search_terms = params[:wordsearch]
	@new_search = Imdb::Search.new(@search_terms)
	@search_results = @new_search.movies[0..8]
	@search_results = @search_results.delete_if {|movie| movie.poster == nil}
	# binding.pry
	erb(:results)
end
