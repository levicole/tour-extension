Factory.define :tour_date do |f|
  f.city 'Nashville'
  f.state 'TN'
  f.country 'US'
  f.date Date.today
  f.venue 'Somet Center'
  f.approved true
  f.description "this is a description of the event."
  f.tickets_link "http://www.ticketmaster.com"
end