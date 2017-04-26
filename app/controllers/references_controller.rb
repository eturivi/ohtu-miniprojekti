class ReferencesController < ApplicationController
  def index
    if params[:tags]
      @references = Article.all.select do |article|
        params[:tags].split(",").any? do |tag_name|
          article.tags.any? do |tag|
            tag.name == tag_name
          end
        end
      end
    else
      @references = Article.all
    end
  end

  def download
    @references = Article.all + Inproceeding.all
    bibtex = ""
    @references.each do |ref|
      bibtex = bibtex + ApplicationController.create_entry(ref) + "\n"
    end
    send_data bibtex, :filename => "all_references.bib"
  end
end
