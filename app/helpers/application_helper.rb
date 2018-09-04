module ApplicationHelper

  def render_title
    return "#{@title} - Dungie" if defined?(@title)
    "Dungie"
  end

end
