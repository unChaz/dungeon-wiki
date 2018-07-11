class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = 'Dungeon Wiki'
    @current_user = current_user
  end

  private
end
