class SituationsController < ApplicationController
  skip_before_action :authenticate_user!


  def show

    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:id])
    @child_choices = @situation.child_choices.sort_by{|c| c.id}
    @parent_choice = @situation.parent_choice
    @previous_situation = @parent_choice.previous_situation if @parent_choice

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
      if choice_params[:previous_choice]
        choice = Choice.find(choice_params[:previous_choice])
        choice.update(next_situation: @situation)
      else
        s = StartSituation.new
        s.story = @story
        s.situation = @situation
        s.save!
      end
      redirect_to edit_story_situation_path(@story, @situation)
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:id])
    @child_choices = @situation.child_choices.sort_by{|c| c.id}
    @parent_choice = @situation.parent_choice
    @previous_situation = @parent_choice.previous_situation if @parent_choice
    @choice = Choice.new
  end


  def update

    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:id])
    if @situation.update(situation_params)
      redirect_to edit_story_situation_path(@story, @situation)
    else
      render edit_story_situation(@story, @situation)
    end

  end

  private
  def situation_params
    params.require(:situation).permit(:description)
  end

  def choice_params
    params.require(:situation).permit(:previous_choice)
  end
end


