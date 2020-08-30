class ChoicesController < ApplicationController
skip_before_action :authenticate_user!

  def create

    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:situation_id])
    @choice = Choice.new(choice_params)
    @choice.previous_situation = @situation

    if @choice.save
      redirect_to edit_story_situation_path(@story, @situation)
    else

    end
  end

  def update

    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:situation_id])
    @choice = Choice.find(params[:id])

    if @choice.update(choice_params)
      redirect_to edit_story_situation_path(@story, @situation)
    else
      render edit_story_situation(@story, @situation)
    end

  end

  def destroy

    @story = Story.find(params[:story_id])
    @situation = Situation.find(params[:situation_id])
    choice = Choice.find(params[:id])
    choice.destroy
    redirect_to edit_story_situation_path(@story, @situation)
  end

  private
  def choice_params
    params.require(:choice).permit(:description)
  end
end
