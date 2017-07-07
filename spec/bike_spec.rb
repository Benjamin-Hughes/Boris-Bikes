require 'bike'

describe Bike do
	subject(:bike) {Bike.new}
	let(:broken_bike) {bike.new(false)}

	it "Bike respond to working?" do
		expect(subject).to respond_to(:working?)
	end

	it "Expects a new bike to be working by default" do
		expect(subject.working?).to eq true
	end

	it "Expects report_broken to set .working? to false" do
		bike.report_broken
		expect(subject.working?).to eq false
	end
end
