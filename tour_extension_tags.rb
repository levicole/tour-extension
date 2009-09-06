module TourExtensionTags
  include Radiant::Taggable
  
  tag 'tour_dates' do |tag|
    tag.expand
  end
  
  tag 'tour_dates:each' do |tag|
    results = []
    TourDate.all(:order => "date asc").each do |tour_date|
      tag.locals.tour_date = tour_date
      results << tag.expand
    end
    results
  end
  
  tag 'tour_dates:each:city_state_country' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.city_state_country}"
  end
  
end