class HomeController < ApplicationController

  def index
    @title = 'Dungie'
    @current_user = current_user
  end

  private
end
