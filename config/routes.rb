Rails.application.routes.draw do
    namespace 'v1' do
        resources :monthly_slip
    end
end
