class WorkoutSessionsController < ApplicationController
    before_action :authenticate_user!  # Asegúrate de que el usuario esté autenticado
  
    def index
      @workout_sessions = current_user.workout_sessions  # Asegúrate de que esta línea esté presente
    end
  
    def new
      @workout_session = current_user.workout_sessions.new  # Crea una nueva sesión de entrenamiento
    end
  
    def create
      @workout_session = current_user.workout_sessions.new(workout_session_params)
      if @workout_session.save
        redirect_to workout_sessions_path, notice: 'Sesión de entrenamiento creada exitosamente.'
      else
        render :new
      end
    end
  
    private
  
    def workout_session_params
      params.require(:workout_session).permit(:date, :activity, :duration, :description)
    end
  end