AjaxExample::Application.routes.draw do
  resources :memos
  resources :tasks do
    get "delete"
  end
  resources :products do
    get "delete"
  end

  root to: "products#index"
end
