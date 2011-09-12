module Admin
  class HomeSlidesController < Admin::BaseController

    crudify :home_slide, :xhr_paging => true

  end
end
