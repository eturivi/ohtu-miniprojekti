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
