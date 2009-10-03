module TourExtensionTags
  include Radiant::Taggable
  
  tag 'tour_dates' do |tag|
    tag.expand
  end
  
  tag 'tour_dates:each' do |tag|
    results = []
    TourDate.find(:all, :order => "date asc").each do |tour_date|
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
  
<<<<<<< HEAD:lib/tour_extension_tags.rb
	tag 'tour_dates:each:venue' do |tag|
		tour_date = tag.locals.tour_date
		"#{tour_date.venue}"
	end

	tag 'tour_dates:each:date' do |tag|
		tour_date = tag.locals.tour_date
		"#{tour_date.date.strftime("%B %d, %Y")}"
	end

	tag 'tour_dates:each:tickets_link' do |tag|
		tour_date = tags.locals.tour_date
		"#{tour_date.tickets_link}"
	end
end
=======
  tag 'tour_dates:each:description' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.description}"
  end
  
  tag 'tour_dates:each:tickets_link' do |tag|
    tour_date = tag.locals.tour_date
    "#{tour_date.tickets_link}"
  end
  
end
>>>>>>> 1b6ee5c664ed99489fe8608d77fdf81ccb83c408:lib/tour_extension_tags.rb
