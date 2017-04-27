class InproceedingsController < ApplicationController
  before_action :set_inproceeding, only: [:show, :edit, :update, :destroy]

  # GET /inproceedings
  # GET /inproceedings.json
  def index
    @inproceedings = Inproceeding.all
  end

  # GET /inproceedings/1
  # GET /inproceedings/1.json
  def show
  end

  # GET /inproceedings/new
  def new
    @inproceeding = Inproceeding.new
  end

  # GET /inproceedings/1/edit
  def edit
  end

  # POST /inproceedings
  # POST /inproceedings.json
  def create
    @inproceeding = Inproceeding.new(inproceeding_params)

    respond_to do |format|
      if @inproceeding.save
        create_key(@inproceeding)
        @inproceeding.save
        format.html { redirect_to @inproceeding, notice: 'Inproceeding was successfully created.' }
        format.json { render :show, status: :created, location: @inproceeding }
      else
        format.html { render :new }
        format.json { render json: @inproceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inproceedings/1
  # PATCH/PUT /inproceedings/1.json
  def update
    respond_to do |format|
      if @inproceeding.update(inproceeding_params)
        format.html { redirect_to @inproceeding, notice: 'Inproceeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @inproceeding }
      else
        format.html { render :edit }
        format.json { render json: @inproceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inproceedings/1
  # DELETE /inproceedings/1.json
  def destroy
    @inproceeding.destroy
    respond_to do |format|
      format.html { redirect_to inproceedings_url, notice: 'Inproceeding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    bibtex = InproceedingsController.create_entry(@inproceeding)
    send_data bibtex, :filename => "inproceeding_reference.bib"
  end

  def self.create_entry(inproceeding)
    "@inproceeding{ #{inproceeding.key},\n"+
    "  author = \"#{inproceeding.author}\",\n" +
    "  title = \"#{inproceeding.title}\",\n" +
    "  booktitle = \"#{inproceeding.booktitle}\",\n" +
    "  year = \"#{inproceeding.year}\",\n" +
    "  editor = \"#{inproceeding.editor}\" }" +
    "  volume = \"#{inproceeding.volume}\",\n" +
    "  series = \"#{inproceeding.series}\",\n" +
    "  pages = \"#{inproceeding.pages}\",\n" +
    "  address = \"#{inproceeding.address}\",\n" +
    "  month = \"#{inproceeding.month}\",\n" +
    "  organization = \"#{inproceeding.organization}\",\n" +
    "  publisher = \"#{inproceeding.publisher}\",\n" +
    "  note = \"#{inproceeding.note}\",\n"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inproceeding
      @inproceeding = Inproceeding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inproceeding_params
      params.require(:inproceeding).permit(:author, :title, :booktitle, :year, :editor, :volume, :series, :pages, :address, :month, :organization, :publisher, :note, :all_tags, :key)
    end
end
