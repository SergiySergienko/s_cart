TestCart::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'products#index'
  resource :products do
    get 'index'
  end


  get 'shopping_cart/index' => 'shopping_cart#index', as: :shopping_cart_index
  get 'shopping_cart/:id/add' => 'shopping_cart#add', as: :shopping_cart_add
  get 'shopping_cart/:id/inc' => 'shopping_cart#inc', as: :shopping_cart_inc
  get 'shopping_cart/:id/dec' => 'shopping_cart#dec', as: :shopping_cart_dec
  get 'shopping_cart/clear' => 'shopping_cart#clear', as: :shopping_cart_clear
  get 'shopping_cart/:id/drop' => 'shopping_cart#drop', as: :shopping_cart_drop


end
