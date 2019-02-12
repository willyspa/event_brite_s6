require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
  @event = FactoryBot.create(:event)
end

it "has a valid factory" do
  # teste toujours tes factories pour voir si elles sont valides
  expect(build(:event)).to be_valid
end

context "validation" do

  it "is valid with valid attributes" do
    expect(@event).to be_a(Event)
  end

  describe "#start_date" do
    it { expect(@event).to validate_presence_of(:start_date) }
    
    it "date_start cannot be in the past" do
    expect(@event.start_date).to be >Time.now
    end
  end

  describe "#duration" do
    it { expect(@event).to validate_presence_of(:duration) }
    
    it { expect(@event.duration%5).to eq(0) }
  end

  describe "#title" do
    it { expect(@event).to validate_presence_of(:title) }

    it "title length" do
    expect(@event.title.length).to be >5 && be <140
    end
  end

  describe "#description" do
    it { expect(@event).to validate_presence_of(:description) }

    it "description length" do
    expect(@event.description.length).to be >20 && be <1000
    end
  end

  describe "#price" do
    it { expect(@event).to validate_presence_of(:price) }

    it "value of price must be between 1 and 1000 " do
    expect(@event.description.length).to be >1 && be <1000
    end
  end

  describe "#title" do
    it { expect(@event).to validate_presence_of(:location) }
  end



end

context "associations" do

  describe "events_associate_to_participants" do
    it { expect(@event).to have_many(:participants) }
  end

  describe "events_associate_to_attendances" do
    it { expect(@event).to have_many(:attendances) }
  end

end

context "public instance methods" do

 describe "#full_name" do

   it "should return a string" do
     expect(@event.title).to be_a(String)
   end

 end

end

end
