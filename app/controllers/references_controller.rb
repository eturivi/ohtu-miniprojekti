class ReferencesController < ApplicationController
  def index
    @references = Article.all
  end

  def download
    @references = Article.all
    bibtex = ""
    @references.each do |ref|
bibtex = bibtex + "@article{ART#{ref.id}
author = {#{ref.author}},
title = {#{ref.title}},
journal = {#{ref.journal}},
volume = {#{ref.volume}},
year = {#{ref.year}},
}\n\n"
    end
    send_data bibtex, :filename => "all_references.bib"
  end
end
