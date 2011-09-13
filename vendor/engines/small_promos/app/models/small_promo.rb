class SmallPromo < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body, :link]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :icon, :class_name => 'Image'
  
  def self.all_enabled
    self.find(:all, :order => "position ASC", :conditions => { :enabled => true })
  end
end
