Given(/^new article is selected$/) do
  visit 'articles/new'
end

Given(/^I am at (.*)$/) do |path|
  visit path == "front page" ? '/' : path
end

When(/^author "(.*)", title "(.*)", year "(.*)", journal "(.*)", volume "(.*)" are given$/) do
  |author, title, year, journal, volume|
  fill_in "Author", with: author
  fill_in "Title", with: title
  fill_in "Year", with: year
  fill_in "Journal", with: journal
  fill_in "Volume", with: volume 
  click_button 'Create Article'
end

When(/all fields except (\w+) are given/) do |missing_field|
  fill_in "Author", with: "Best Author Ever" if missing_field != "Author"
  fill_in "Title", with: "Best Title Ever" if missing_field != "Title"
  fill_in "Year", with: 666 if missing_field != "Year"
  fill_in "Journal", with: "Best Journal Ever" if missing_field != "Journal"
  fill_in "Volume", with: 42 if missing_field != "Volume"
  click_button 'Create Article'
end

When(/^I click "(.*)"$/) do |link|
  click_link link
end

Then(/^article is added$/) do
  assert page.has_content?('Article was successfully created.')
end

Then(/^scandics are shown properly$/) do
  assert page.has_content?('Ääöå')
end

Then(/^article is not added and error message is given$/) do
  assert page.has_content?('1 error prohibited this article from being saved')
end

Then(/^the information is shown in human readable form$/) do
  assert page.has_content?('Author: test user åäö')
  assert page.has_content?('Title: test article')
  assert page.has_content?('Year: 2017')
  assert page.has_content?('Journal: test journal')
  assert page.has_content?('Volume: 189')
end
