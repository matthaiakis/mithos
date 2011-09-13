class SmallPromosController < ApplicationController

  before_filter :find_all_small_promos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @small_promo in the line below:
    present(@page)
  end

  def show
    @small_promo = SmallPromo.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @small_promo in the line below:
    present(@page)
  end

protected

  def find_all_small_promos
    @small_promos = SmallPromo.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/small_promos").first
  end

end
