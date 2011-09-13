module Admin
  class SmallPromosController < Admin::BaseController

    crudify :small_promo, :xhr_paging => true

  end
end
