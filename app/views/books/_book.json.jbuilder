json.extract! book, :id, :author, :title, :publisher, :year, :volume, :series, :address, :edition, :month, :note, :key, :created_at, :updated_at
json.url book_url(book, format: :json)
