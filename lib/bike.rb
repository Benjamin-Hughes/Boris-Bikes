class Bike
	def initialize(working = true)
		@working = working
	end
	def working?
		@working == true ? true:false
	end
	def report_broken
		@working = false
	end
end
