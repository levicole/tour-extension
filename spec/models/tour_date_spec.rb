require File.dirname(__FILE__) + '/../spec_helper'

describe TourDate do
  
  def required_attributes
    {
      :city => "Nashville",
      :state => "TN",
      :date => Date.today
    }
  end
  
  it "should automatically set country to US" do
    @tour_date = TourDate.new
    @tour_date.country.should == "US"
  end
  
  describe "validations" do
    it_should_validate_presence_of(:city, :state, :date)
  end
  
  describe "#city_state_country" do
    it "returns the city state and country in the following format 'City, State (Country)'" do
      @tour_date = TourDate.new(required_attributes)
      @tour_date.city_state_country.should == "Nashville, TN (US)"
    end
  end
  
end