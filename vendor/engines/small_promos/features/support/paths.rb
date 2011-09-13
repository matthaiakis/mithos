module NavigationHelpers
  module Refinery
    module SmallPromos
      def path_to(page_name)
        case page_name
        when /the list of small_promos/
          admin_small_promos_path

         when /the new small_promo form/
          new_admin_small_promo_path
        else
          nil
        end
      end
    end
  end
end
