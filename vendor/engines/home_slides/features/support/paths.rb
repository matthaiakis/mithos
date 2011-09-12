module NavigationHelpers
  module Refinery
    module HomeSlides
      def path_to(page_name)
        case page_name
        when /the list of home_slides/
          admin_home_slides_path

         when /the new home_slide form/
          new_admin_home_slide_path
        else
          nil
        end
      end
    end
  end
end
