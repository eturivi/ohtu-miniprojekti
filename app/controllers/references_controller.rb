class ReferencesController < ApplicationController
  def index
    if params[:tags]
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

  def download
    set_references
    bibtex = ""
    @references.each do |ref|
      bibtex = bibtex + ApplicationController.create_entry(ref) + "\n"
    end
    send_data bibtex, :filename => "all_references.bib"
  end

  private

  def set_references
    @references = Article.all + Inproceeding.all + Book.all
  end
end
