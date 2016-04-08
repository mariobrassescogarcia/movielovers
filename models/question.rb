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
		@movielist.select { |movie| movie.year == @year_asked}
	end

end



