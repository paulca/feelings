# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def display_flash
    flash[:notice] if flash[:notice]
  end
end
