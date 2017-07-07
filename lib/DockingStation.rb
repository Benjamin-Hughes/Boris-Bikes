require 'pry'
require './lib/bike.rb'
class DockingStation

	attr_reader :bikes
	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail 'No bikes available to release' if empty?
		fail 'No working bikes available' if working_bike_array.empty?
		@bikes.delete(working_bike_array.pop)
	end

	def dock(bike)
		raise "Docking Station full" if full?
		@bikes << bike
		"This bike is broken!" if bike.working? == false
	end

	private
	def working_bike_array
		@bikes.reject { |bike| bike.working? == false}
	end

	def full?
		@bikes.length == DEFAULT_CAPACITY ? true : false
	end

	def empty?
		@bikes.length == 0 ? true : false
	end
end
