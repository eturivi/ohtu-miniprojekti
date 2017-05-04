class ReferencesController < ApplicationController
  def index
    if params[:tags].present?
      @references = set_references.select do |ref|
        params[:tags].split(",").any? do |tag_name|
          ref.tags.any? do |tag|
            tag.name == tag_name
          end
        end
      end
    else
      set_references
    end
  end

  def download_all
    set_references
    create_bibtex_and_download("all_references.bib")
  end

  def download_selected
    #Olis kyl salee joku parempiki tapa tehä tää :-D
    if params.has_key?(:selected_references)
      set_selection
      create_bibtex_and_download(set_name("selected_references.bib"))
    else
      set_references
      create_bibtex_and_download(set_name("all_references.bib"))
    end
  end

  private

  def set_name(fileName)
    if params[:bibtex_name].blank?
      return fileName
    else
      return params[:bibtex_name]
    end
  end

  def set_references
    @references = Article.all + Inproceeding.all + Book.all
  end

  def set_selection
    @references = []
    types = ["Article", "Inproceeding", "Book"]
    types.each do |type|
      if params[type + "selected"]
        @references += type.constantize.find(params[type + "selected"])
      end
    end
  end

  def create_bibtex_and_download(filename)
    bibtex = ""
    @references&.each do |ref|
      bibtex = bibtex + ApplicationController.create_entry(ref) + "\n"
    end
    send_data bibtex, :filename => filename
  end
end
