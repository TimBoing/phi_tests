class SituationsController < ApplicationController
  skip_before_action :authenticate_user!


  def show

    # raise
    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:id])
    @child_choices = @situation.child_choices.sort_by{|c| c.id}
    @parent_choice = @situation.parent_choice
    @previous_situation = @parent_choice.previous_situation if @parent_choice
    @loop_start = @situation


  end

  def new


    @story = Story.find(params[:story_id])
    # @previous_situation = @parent_choice.previous_situation if @parent_choice
    @situation = Situation.new
    if params[:choice]
      @previous_choice = Choice.find(params[:choice])
      @previous_situation = @previous_choice.previous_situation
    end


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

  def return_situation
    # render json: {tamere: "le slip"} and return
    render json: {situation: Situation.first} and return
    # return Situation.first
  end

  private
  def situation_params
    params.require(:situation).permit(:description)
  end

  def choice_params
    params.require(:situation).permit(:previous_choice)
  end
end


