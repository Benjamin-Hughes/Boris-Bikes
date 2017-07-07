
require 'DockingStation'

describe DockingStation do
	subject { DockingStation.new }

	let(:bike) 				{ double(:bike, working?: true ) }
	let(:broken_bike) { double(:bike, working?: false ) }

	let(:station) {DockingStation.new(15)}

	it "responds to release_bike" do
		expect(subject).to respond_to(:release_bike)
	end
	it "raises an error if it tries to release a bike when none are available" do
		expect { subject.release_bike }.to raise_error("No bikes available to release")
	end

	it "successfully docks a bike" do
		expect(subject.bikes.length).to eq 0
		subject.dock(bike)
		expect(subject.bikes.length).to eq 1
	end

	it "returns a bike after release_bike called" do
		subject.dock(bike)
		expect(subject.release_bike).to be bike
	end

	it "checks to see that we don't release broken bikes" do
		subject.dock(bike)
		subject.dock(broken_bike)
		expect((subject.release_bike).working?).to eq true
	end
	it "raises an error if docking station is full and user tries to dock a bike" do
		DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
		expect { subject.dock(bike) }.to raise_error("Docking Station full")
	end

	it "checks to see that capacity can be set when a new DockingStation is created" do
		expect(station.capacity).to eq 15
	end

	it "checks to see if the default capacity is set when a new DockingStation is created" do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it "accepts both working and broken bikes" do
		subject.dock(bike)
		expect(subject.bikes.length).to eq 1
		subject.dock(broken_bike)
		expect(subject.bikes.length).to eq 2
	end

	it "checks to see if a bike being docked is broken and reports it if it is" do
		expect(subject.dock(broken_bike)).to eq "This bike is broken!"
	end


end
