class HomeSlidesController < ApplicationController

  before_filter :find_all_home_slides
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @home_slide in the line below:
    present(@page)
  end

  def show
    @home_slide = HomeSlide.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @home_slide in the line below:
    present(@page)
  end

protected

  def find_all_home_slides
    @home_slides = HomeSlide.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/home_slides").first
  end

end
