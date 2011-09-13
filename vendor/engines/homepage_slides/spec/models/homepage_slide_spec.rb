require 'spec_helper'

describe HomepageSlide do

  def reset_homepage_slide(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @homepage_slide.destroy! if @homepage_slide
    @homepage_slide = HomepageSlide.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_homepage_slide
  end

  context "validations" do
    
    it "rejects empty title" do
      HomepageSlide.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_homepage_slide
      HomepageSlide.new(@valid_attributes).should_not be_valid
    end
    
  end

end