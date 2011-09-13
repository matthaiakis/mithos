Given /^I have no small_promos$/ do
  SmallPromo.delete_all
end

Given /^I (only )?have small_promos titled "?([^\"]*)"?$/ do |only, titles|
  SmallPromo.delete_all if only
  titles.split(', ').each do |title|
    SmallPromo.create(:title => title)
  end
end

Then /^I should have ([0-9]+) small_promos?$/ do |count|
  SmallPromo.count.should == count.to_i
end
