class API::V1::SubjectsController < ApplicationController

  # Callback DRY para 'setear' un subject antes de operar con el
  before_action :set_subject, only: [:show, :update, :destroy]

  def index
    @subjects = Subject.all
    render json: @subjects, status: :ok
  end

  def show
    render json: @subject,status: :ok
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: { notification: "Materia creada satisfactoriamente" }, status: 201
    else
      render json: { notification: "Error al crear materia", errors: @subject.errors }, status: 422
    end
  end

  def update
    if @subject.update(subject_params)
      render json: { notification: "Materia actualizada satisfactoriamente" }, status: 201
    else
      render json: { notification: "Error al actualizar materia", errors: @subject.errors }, status: 422
    end
  end

  def destroy
    if @subject.destroy
      render json: { notification: "Materia eliminada satisfactoriamente" }, status: 200
    else
      render json: { notification: "Error al eliminar materia", errors: @subject.errors }, status: 422
    end
  end

  def subject_params
    params.require(:subject).permit(:subject_name, :subject_description, :exam_1, :exam_2, :exam_3, :exam_average, :teacher_name)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end