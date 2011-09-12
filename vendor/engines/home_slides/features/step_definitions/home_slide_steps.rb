Given /^I have no home_slides$/ do
  HomeSlide.delete_all
end


Then /^I should have ([0-9]+) home_slides?$/ do |count|
  HomeSlide.count.should == count.to_i
end
