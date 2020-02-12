Rails.application.routes.draw do
    mount_graphql_devise_for 'User', at: 'api/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    # mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "api/auth"
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"

end
