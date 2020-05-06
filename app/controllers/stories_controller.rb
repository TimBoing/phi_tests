class StoriesController < ApplicationController
  skip_before_action :authenticate_user!


  def index

    @stories = Story.all

  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])

    unless StartSituation.where(story: @story).first.nil?
      @story_start_situation = StartSituation.where(story: @story).first.situation
    else
      @story_start_situation = nil
    end

  end

  private
  def story_params
    params.require(:story).permit(:name, :description)
  end
end
