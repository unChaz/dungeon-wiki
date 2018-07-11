module ApplicationHelper

  def render_title
    return "#{@title} - Dungeon Wiki" if defined?(@title)
    "Dungeon Wiki"
  end

end
