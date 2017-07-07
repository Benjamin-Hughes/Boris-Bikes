require './lib/DockingStation.rb'
require './lib/bike.rb'

station = DockingStation.new(21)
p 10.times { station.dock(Bike.new) }
p 2.times { station.dock(Bike.new.report_broken) }
p 5.times { station.dock(Bike.new) }
p 4.times { station.dock(Bike.new.report_broken) }

p 16.times { station.release_bike}
