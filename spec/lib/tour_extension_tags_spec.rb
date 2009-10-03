require File.dirname(__FILE__) + '/../spec_helper'

describe "TourExtensionTags" do
  dataset :pages

  describe "<r:tour_dates:each>" do
    
    before(:each) do
      @tour_dates = [Factory(:tour_date)]
    end
    
    def do_nested_tag(tag)
      "<r:tour_dates:each>#{tag}</r:tour_dates:each>"
    end
    
    it 'should render city_state_zip when <r:city_state_country> is nested' do
      tag = do_nested_tag("<r:city_state_country />")
      expected = %{Nashville, TN (US)}
      pages(:home).should render(tag).as(expected)
    end
    
    it "should render city when <r:city> is nested" do
      tag = do_nested_tag("<r:city />")
      expected = %{Nashville}
      pages(:home).should render(tag).as(expected)
    end
    
    it "should render state when <r:state> is nested" do
      tag = do_nested_tag("<r:state />")
      expected = "TN"
      pages(:home).should render(tag).as(expected)
    end
    
    it "should render country when <r:country> is nested" do
      tag = do_nested_tag("<r:country />")
      expected = "US"
      pages(:home).should render(tag).as(expected)
    end
    
    it "should render description when <r:description> is nested" do
      tag = do_nested_tag("<r:description />")
      expected = "this is a description of the event."
      pages(:home).should render(tag).as(expected)
    end
    
    it "should render tickets link when <r:tickets_link> is nested" do
      tag = do_nested_tag("<r:tickets_link />")
      expected = "http://www.ticketmaster.com"
      pages(:home).should render(tag).as(expected)
    end
    
  end

end
