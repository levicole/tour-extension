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
  
  tag 'tour_dates:each:date' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.date}"
  end
  
  tag 'tour_dates:each:city' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.city}"
  end
  
  tag 'tour_dates:each:state' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.state}"
  end
  
  tag 'tour_dates:each:country' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.country}"
  end
  
end