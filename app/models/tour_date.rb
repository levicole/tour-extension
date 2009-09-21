class TourDate < ActiveRecord::Base

  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :date
  validates_presence_of :venue
   
  def city_state_country
    "#{city}, #{state} (#{country})"
  end

end
