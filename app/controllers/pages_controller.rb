class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :tests]

  def home
  end

  def tests
  end

end
