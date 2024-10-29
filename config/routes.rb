Rails.application.routes.draw do
  # Configuración de Devise
  devise_for :users

  # Define el alcance de Devise para el inicio de sesión cuando el usuario no está autenticado
  devise_scope :user do
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Define la página de inicio cuando el usuario está autenticado
  authenticated :user do
    root 'workout_sessions#index', as: :authenticated_root
  end

  # Otras rutas para workout_sessions
  resources :workout_sessions
end

