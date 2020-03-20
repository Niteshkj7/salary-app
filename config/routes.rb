Rails.application.routes.draw do
  resources :salaries
  resources :leaves
  resources :salary_allotments
  resources :salary_heads
  resources :employees
  resources :generate_payslips



  root 'employees#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
