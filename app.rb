require "sinatra"
require "sinatra/reloader"
require "pry"
require "imdb"
require_relative "./models/question.rb"
require_relative "./models/checker.rb"


# enable:sessions

get "/" do 
	erb(:home)	
end

checker = Checker.new


get "/results" do

	@search_terms = params[:wordsearch]
	@new_search = Imdb::Search.new(@search_terms)
	@search_results = @new_search.movies[0..8]
	@search_results = @search_results.delete_if {|movie| movie.poster == nil}

	@question = Question.new(@search_results)
	checker.add_question(@question)
	erb(:results)
end

 post "/check_answer" do

	@answer = params[:movieyear]
	binding.pry 	
		 if @answer == checker.right_answer.right_answer
	 		redirect "/ok"
			erb(:ok)
		else
			redirect "/nook"

			erb(:nook)
		end
end