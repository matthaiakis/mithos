if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'home_slides').blank?
      user.plugins.create(:name => 'home_slides',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Home Slides',
    :link_url => '/home_slides',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/home_slides(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end