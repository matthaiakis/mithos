module NavigationHelpers
  module Refinery
    module HomepageSlides
      def path_to(page_name)
        case page_name
        when /the list of homepage_slides/
          admin_homepage_slides_path

         when /the new homepage_slide form/
          new_admin_homepage_slide_path
        else
          nil
        end
      end
    end
  end
end
