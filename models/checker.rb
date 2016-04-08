class Checker
	attr_reader :questions
	def add_question question
		@questions = []
		@questions.push(question)
	end

	def right_answer
		@questions.first
	end
end