# frozen_string_literal: true

###
# asfasfas fas fasf
###
class NotesController < ApplicationController
  def index
    @notes = Note.all
    render json: @notes
  end

  def show
    @note = Note.find(params[:id])
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: @note, status: 204
  end

  def note_params
    params.require(:note).permit(:text, :diary_id)
  end
end
