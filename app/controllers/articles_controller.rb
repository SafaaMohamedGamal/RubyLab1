class ArticlesController < ApplicationController
	load_and_authorize_resource  
	# http_basic_authenticate_with name: "dhh", password: "secret",
	# except: [:index, :show]
	def index
	    @articles = Article.all
	  end

	def show
	    @article = Article.find(params[:id])
	    authorize! :show, @article
	  end

	def new
		@article = Article.new
		authorize! :new, @article
	end

	def edit
	  @article = Article.find(params[:id])
	end

	def create
	  @author = Author.find(current_author.id)
		@article = @author.articles.new(article_params)
		if @article.save
		    redirect_to @article
		  else
		    render 'new'
		  end
		  authorize! :create, @project
		# render plain: params[:article].inspect
	end

	def update
	  @article = Article.find(article_params)
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

