require "imdb"


class Question

	def initialize movielist
		@movielist = movielist
		@yearslist = @movielist.map do |movie|
			movie.year
		end
		@year_asked = @yearslist.sample
		@question = "What movie was released in #{@year_asked}?"
	end

	def right_answer 
		@movielist.select { |movie| movie.year == @year_asked}
	end

end



