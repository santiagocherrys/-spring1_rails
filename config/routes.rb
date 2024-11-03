Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/coffee/ask', to: 'coffee#askCoffee'
      get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
      get '/coffee', to: 'coffee#index'
      get '/coffee/:id', to: 'coffee#show'
      post 'coffee', to: 'coffee#create'
      patch '/coffee/:id', to: 'coffee#update'
      delete '/coffee/:id', to:'coffee#destroy'
      
    end
  end
  
end
