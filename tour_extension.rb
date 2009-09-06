# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class TourExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/tour"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :tour_dates
    end
  end
  
  def activate
    admin.tabs.add "Tour", "/admin/tour_dates", :after => "Pages", :visibility => [:all]
    Page.send :include, TourExtensionTags
  end
  
  def deactivate
    admin.tabs.remove "Tour"
  end
  
end
