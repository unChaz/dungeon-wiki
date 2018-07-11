class WikiPagesController < ApplicationController
  before_filter :authenticate_user!
  acts_as_wiki_pages_controller

  def edit_allowed?
    current_user.content_creator? || current_user.admin?
  end

  def show_allowed?
    true
  end

  def history_allowed?
    current_user.content_creator? || current_user.admin?
  end

  def destroy_allowed?
    current_user.content_creator? || current_user.admin?
  end
end
