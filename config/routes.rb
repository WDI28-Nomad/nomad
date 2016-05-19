Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'
  get 'welcome/index'

  resources :users do
    resources :trips do
      resources :expenses
    end
  end

  match "*path", to: 'welcome#index', via: :all

#   new_user_session GET    /users/sign_in(.:format)                                   devise/sessions#new
#       user_session POST   /users/sign_in(.:format)                                   devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)                                  devise/sessions#destroy
#      user_password POST   /users/password(.:format)                                  devise/passwords#create
#  new_user_password GET    /users/password/new(.:format)                              devise/passwords#new
# edit_user_password GET    /users/password/edit(.:format)                             devise/passwords#edit
#                    PATCH  /users/password(.:format)                                  devise/passwords#update
#                    PUT    /users/password(.:format)                                  devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                    devise/registrations#cancel
#  user_registration POST   /users(.:format)                                           devise/registrations#create
# new_user_registration GET    /users/sign_up(.:format)                                   devise/registrations#new
# edit_user_registration GET    /users/edit(.:format)                                      devise/registrations#edit
#                    PATCH  /users(.:format)                                           devise/registrations#update
#                    PUT    /users(.:format)                                           devise/registrations#update
#                    DELETE /users(.:format)                                           devise/registrations#destroy
#               root GET    /                                                          welcome#index
#      welcome_index GET    /welcome/index(.:format)                                   welcome#index
# user_trip_expenses GET    /users/:user_id/trips/:trip_id/expenses(.:format)          expenses#index
#                    POST   /users/:user_id/trips/:trip_id/expenses(.:format)          expenses#create
# new_user_trip_expense GET    /users/:user_id/trips/:trip_id/expenses/new(.:format)      expenses#new
# edit_user_trip_expense GET    /users/:user_id/trips/:trip_id/expenses/:id/edit(.:format) expenses#edit
#  user_trip_expense GET    /users/:user_id/trips/:trip_id/expenses/:id(.:format)      expenses#show
#                    PATCH  /users/:user_id/trips/:trip_id/expenses/:id(.:format)      expenses#update
#                    PUT    /users/:user_id/trips/:trip_id/expenses/:id(.:format)      expenses#update
#                    DELETE /users/:user_id/trips/:trip_id/expenses/:id(.:format)      expenses#destroy
#         user_trips GET    /users/:user_id/trips(.:format)                            trips#index
#                    POST   /users/:user_id/trips(.:format)                            trips#create
#      new_user_trip GET    /users/:user_id/trips/new(.:format)                        trips#new
#     edit_user_trip GET    /users/:user_id/trips/:id/edit(.:format)                   trips#edit
#          user_trip GET    /users/:user_id/trips/:id(.:format)                        trips#show
#                    PATCH  /users/:user_id/trips/:id(.:format)                        trips#update
#                    PUT    /users/:user_id/trips/:id(.:format)                        trips#update
#                    DELETE /users/:user_id/trips/:id(.:format)                        trips#destroy
#              users GET    /users(.:format)                                           users#index
#                    POST   /users(.:format)                                           users#create
#           new_user GET    /users/new(.:format)                                       users#new
#          edit_user GET    /users/:id/edit(.:format)                                  users#edit
#               user GET    /users/:id(.:format)                                       users#show
#                    PATCH  /users/:id(.:format)                                       users#update
#                    PUT    /users/:id(.:format)                                       users#update
#                    DELETE /users/:id(.:format)                                       users#destroy
end
