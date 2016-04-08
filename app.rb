require "sinatra"
require "sinatra/reloader"
require "pry"
require "imdb"




get "/" do 
	erb(:home)	
end



post "/searching" do

	params.inspect
	@search_terms = params[:wordsearch]
	@new_search = Imdb::Search.new(@search_terms)
	@search_results = @new_search.movies
	binding.pry
		if @search_results.length > 9
			@first_nine_results = @search_results.each_with_index {|movie, index|
				while index <= 9
					return movie
				end
			}

		end

	redirect "/results"
end


get "/results" do
	erb(:results)
end

