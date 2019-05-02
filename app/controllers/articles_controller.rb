class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :home, :show]	

	def index
	end
	def home
		@toindex = Article.all.order("created_at DESC").paginate(page: params[:page], per_page:3)
		render 'articles'
	end
	
	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def new
		@toform = current_user.articles.build
	end

	def create
	  @toform = current_user.articles.build(article_params)
	  if @toform.save
	  	redirect_to @toform
	  else
	  	render 'new'
	  end
	end


  def show
		@toshow = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
	 
	private
	def article_params
		params.require(:article).permit(:title, :body, :image)
	end
end
