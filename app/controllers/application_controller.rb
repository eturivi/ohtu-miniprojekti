class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def create_key(reference)
    if(reference.key.blank?)
      reference.key = reference.author[0,3] + reference.year.to_s + reference.id.to_s
    end
  end

end
