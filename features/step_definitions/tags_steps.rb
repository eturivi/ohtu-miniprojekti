When(/^references are searched by tag "([^"]*)"$/) do |arg1|
  visit '/'
  fill_in "tags", with: arg1+'\n'

end

Then(/^no references are returned$/) do
	assert !page.has_content?("nomatch")
end

Then(/^reference with type "([^"]*)" and tag "([^"]*)" is returned$/) do |arg1, arg2|
  assert page.has_content?(arg1)
  assert page.has_content?(arg2)
end

Given(/^new inproceeding is selected$/) do
  visit "/inproceedings/new"
end

When(/^send help author "([^"]*)", title "([^"]*)", year "([^"]*)", journal "([^"]*)", volume "([^"]*)", tag "([^"]*)" are given$/) do 
  |author, title, year, journal, volume, tags|
  fill_in "Author", with: author
  fill_in "Title", with: title
  fill_in "Year", with: year
  fill_in "Journal", with: journal
  fill_in "Volume", with: volume
  fill_in "article_all_tags", with: tags
  click_button 'Create Article'
end

When(/^author "([^"]*)", title "([^"]*)", booktitle "([^"]*)" year "([^"]*)", tag "([^"]*)" are given$/) do 
  |author, title, booktitle, year, tag|
  fill_in "Author", with: author
  fill_in "Title", with: title
  fill_in "Booktitle", with: booktitle
  fill_in "Year", with: year
  fill_in "inproceeding_all_tags", with: tag
  click_button 'Create Inproceeding'
end


When(/^author "([^"]*)", title "([^"]*)", publisher "([^"]*)", year "([^"]*)", tag "([^"]*)" are given$/) do 
  |author, title, publisher, year, tag|
  fill_in "Author", with: author
  fill_in "Title", with: title
  fill_in "Publisher", with: publisher
  fill_in "Year", with: year
  fill_in "book_all_tags", with: tag
  click_button 'Create Book'
end

When(/^new book is selected$/) do
  visit "/books/new"
end

