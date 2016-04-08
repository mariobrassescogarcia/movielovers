require "imdb"


class Question
	attr_reader :year_asked, :question
	def initialize movielist
		@movielist = movielist
		@yearslist = @movielist.map do |movie|
			movie.year
		end
		@year_asked = @yearslist.sample
		@question = "Which movie was released in #{@year_asked}?"
	end

	def right_answer 
		@correct_film = @movielist.find { |movie| movie.year == @year_asked}
		@correct_year = @correct_film.year
		@correct_year
	end

end



