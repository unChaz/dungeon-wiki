class HomeController < ApplicationController

  def index
    @title = 'Dungeon Wiki'
    @current_user = current_user
  end

  private
end
