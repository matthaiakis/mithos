Given /^I have no homepage_slides$/ do
  HomepageSlide.delete_all
end

Given /^I (only )?have homepage_slides titled "?([^\"]*)"?$/ do |only, titles|
  HomepageSlide.delete_all if only
  titles.split(', ').each do |title|
    HomepageSlide.create(:title => title)
  end
end

Then /^I should have ([0-9]+) homepage_slides?$/ do |count|
  HomepageSlide.count.should == count.to_i
end
