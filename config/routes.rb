Rails.application.routes.draw do
  root 'vendings#index'
  post 'vendings/activise', to: 'vendings#activise'
  post 'vendings/check_num', to: 'vendings#check_num'
  post 'vendings/check_money', to: 'vendings#check_money'
  post 'vendings/give_product', to: 'vendings#give_product'
  post 'vendings/give_sdacha', to: 'vendings#give_sdacha'
end
