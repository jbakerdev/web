Rails.application.routes.draw do
  root to: "home#index"

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end
end
