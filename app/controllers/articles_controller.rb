class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :download]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        create_key
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    bibtex = ArticlesController.create_entry(@article)
    send_data bibtex, :filename => "article_reference.bib"
  end

  def self.create_entry(article)
    "@article{ #{article.key},\n"+
    "  author = \"#{article.author}\",\n" +
    "  title = \"#{article.title}\",\n" +
    "  journal = \"#{article.journal}\",\n" +
    "  volume = \"#{article.volume}\",\n" +
    "  year = \"#{article.year}\" }"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(
        :author, :title, :year, :journal, :volume, :all_tags, :key)
    end

    def create_key
      if(@article.key.blank?)
        @article.key = @article.author[0,3] + @article.year.to_s + @article.id.to_s
        @article.save
      end
    end
  end
