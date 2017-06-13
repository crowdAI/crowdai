class Components::SearchController < ApplicationController
  def show
    query = params[:term]
    @challenges = Challenge.search query, page: params[:page], per_page: 3
    @articles = Article.search query, page: params[:page], per_page: 3
    @comments = Comment.search query, page: params[:page], per_page: 3
  end
end
