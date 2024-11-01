# app/controllers/workout_sessions_controller.rb
class WorkoutSessionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @workout_session = current_user.workout_sessions.find(params[:id])
  end
  

  def index
    @workout_sessions = current_user.workout_sessions.order(date: :desc)
  end

  def new
    @workout_session = current_user.workout_sessions.build
  end

  def create
    @workout_session = current_user.workout_sessions.build(workout_session_params)

    if @workout_session.save
      redirect_to workout_sessions_path, notice: 'Sesión de entrenamiento creada exitosamente.'
    else
      render :new
    end
  end

  def edit
    @workout_session = current_user.workout_sessions.find(params[:id])
  end

  def update
    @workout_session = current_user.workout_sessions.find(params[:id])

    if @workout_session.update(workout_session_params)
      redirect_to workout_sessions_path, notice: 'Sesión de entrenamiento actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @workout_session = current_user.workout_sessions.find(params[:id])
    @workout_session.destroy
    redirect_to workout_sessions_path, notice: 'Sesión de entrenamiento eliminada exitosamente.'
  end

  private

  def workout_session_params
    params.require(:workout_session).permit(:date, :activity, :duration, :description)
  end
end

