class ReferencesController < ApplicationController
  def index
    @references = Article.all
  end
end
