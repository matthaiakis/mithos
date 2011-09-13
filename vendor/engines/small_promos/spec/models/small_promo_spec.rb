require 'spec_helper'

describe SmallPromo do

  def reset_small_promo(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @small_promo.destroy! if @small_promo
    @small_promo = SmallPromo.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_small_promo
  end

  context "validations" do
    
    it "rejects empty title" do
      SmallPromo.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_small_promo
      SmallPromo.new(@valid_attributes).should_not be_valid
    end
    
  end

end