require 'spec_helper'

describe HomeSlide do

  def reset_home_slide(options = {})
    @valid_attributes = {
      :id => 1
    }

    @home_slide.destroy! if @home_slide
    @home_slide = HomeSlide.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_home_slide
  end

  context "validations" do
    
  end

end