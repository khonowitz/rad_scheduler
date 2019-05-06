Rails.application.routes.draw do

    devise_for :admins

    resources :employees

    resources :rotations

    resources :schedules, only: [] do
        collection do
            get :generate
            get :export
        end
    end

    root 'employees#index'
end
