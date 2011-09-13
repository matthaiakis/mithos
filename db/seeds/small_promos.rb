if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'small_promos').blank?
      user.plugins.create(:name => 'small_promos',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end