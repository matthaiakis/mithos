::Refinery::Application.routes.draw do
  resources :small_promos, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :small_promos, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
