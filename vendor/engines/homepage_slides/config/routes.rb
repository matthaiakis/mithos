::Refinery::Application.routes.draw do
  resources :homepage_slides, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :homepage_slides, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
