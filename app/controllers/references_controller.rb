require 'open-uri'

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

  def import_from_acm
    return if request.method == "GET"

    url = params[:acm_link]
    headers = {
      # Pretend we're not scraping, to avoid 403 Forbidden response from ACM.
      "User-Agent" => "Mozilla/5.0 (X11; U; Linux i686) Gecko/20071127 Firefox/2.0.0.11"
    }
    html = Nokogiri::HTML(open(url, headers))

    get = -> key { html.at("meta[name='citation_#{key}']")&.[]('content') }

    # The common metadata.
    publisher = get['publisher']
    authors = get['authors']
    title = get['title']
    date = Date.strptime(get['date'], '%m/%d/%Y')
    abstract_html_url = get['abstract_html_url']

    if journal_title = get['journal_title']
      # It's probably an article.
      volume = get['volume']
      issue = get['issue']
      first_page = get['firstpage']
      pdf_url = get['pdf_url']
      tags = get['keywords'].split('; ')

      @reference = Article.new(author: authors, title: title, year: date.year,
                               journal: journal_title, volume: volume, number: issue,
                               pages: first_page, month: date.month, note: pdf_url)
    elsif isbn = get['isbn']
      # It's probably a book.
      @reference = Book.new(author: authors, title: title, publisher: publisher,
                            year: date.year, month: date.month, note: abstract_html_url)
    else
      # It's something we don't currently support.
      return redirect_to :back, notice: 'Cannot import that type of reference yet.'
    end

    create_key(@reference)

    if @reference.save
      redirect_to :back, notice: 'Imported successfully.'
    else
      redirect_to :back, notice: 'Import failed.'
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
