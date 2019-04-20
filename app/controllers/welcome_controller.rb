class WelcomeController < ApplicationController
  
  def index
  	@toindex = Article.all
  end

end
