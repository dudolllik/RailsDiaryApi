# frozen_string_literal: true

###
# asfasfas fas fasf
###
class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
    render json: @diaries
  end

  def show
    @diary = Diary.find(params[:id])
    render json: @diary
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      render json: @diary, status: :created
    else
      render json: @diary.errors, status: :unprocessable_entity
    end
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      render json: @diary, status: :created
    else
      render json: @diary.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    render json: @diary, status: 204
  end

  def diary_params
    params.require(:diary).permit(:title, :expiration, :kind)
  end
end
