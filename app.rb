require "sinatra"
require "sinatra/reloader"
require "pry"
require "imdb"
require_relative "./models/question.rb"




get "/" do 
	erb(:home)	
end



get "/results" do
	@search_terms = params[:wordsearch]
	@new_search = Imdb::Search.new(@search_terms)
	@search_results = @new_search.movies[0..8]
	@search_results = @search_results.delete_if {|movie| movie.poster == nil}

	@question = Question.new(@search_results)

	erb(:results)
end
