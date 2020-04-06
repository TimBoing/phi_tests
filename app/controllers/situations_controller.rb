class SituationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @situation = Situation.find(params[:situation])
  end

end
