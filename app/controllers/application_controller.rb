class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def create_key(reference)
    if(reference.key.blank?)
      reference.key = reference.author[0,3] + reference.year.to_s + reference.id.to_s
    end
  end

  def self.create_entry(reference)
    entry_string = "@#{reference.class.name.downcase}{ #{reference.key}"

    reference.attributes.each do |key, value|
      if !key.to_s.in?(["id", "created_at", "updated_at", "key"]) && !value.blank?
        entry_string = entry_string + ",\n  #{key} = \"#{value}\""
      end
    end
    entry_string = entry_string + " }\n"
  end

end
