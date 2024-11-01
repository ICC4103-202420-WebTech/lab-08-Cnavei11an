Rails.application.routes.draw do
  # Configura las rutas para Devise
  devise_for :users

  # Define la ruta raíz de la aplicación (cámbiala si tienes otra vista principal)
  root "workout_sessions#index" # Cambia esto según la página que quieras como inicio
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Rutas para WorkoutSessions (asegúrate de que existen estas rutas)
  resources :workout_sessions
end


