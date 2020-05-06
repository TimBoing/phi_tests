class SituationsController < ApplicationController
  skip_before_action :authenticate_user!


  def show
    @situation = Situation.find(params[:id])
    @child_choices = @situation.child_choices
    @parent_choice = @situation.parent_choice
  end

  def new
    @story = Story.find(params[:story_id])
    @situation = Situation.new
  end

  def create
    @story = Story.find(params[:story_id])
    @situation = Situation.new(situation_params)
    @situation.story = @story

    if @situation.save
      if @story.situations.count == 1
        s = StartSituation.new
        s.story = @story
        s.situation = @situation
        s.save!
      end
      redirect_to story_situation_path(@story, @situation)
    else
      render :new
    end
  end

  def edit
    @situation = Situation.find(params[:id])
    @child_choices = @situation.child_choices
    @parent_choice = @situation.parent_choice
  end

  private
  def situation_params
    params.require(:situation).permit(:description)
  end
end
