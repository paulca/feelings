class FeelingsController < ApplicationController
  def index
    @posts = Post.by_published_and_date
  end
end
