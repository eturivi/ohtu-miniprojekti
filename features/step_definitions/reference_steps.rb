Given(/^I am at (.*)$/) do |page_path|
  visit page_path
end

Given(/^I have filled in author as "(.*)", title as "(.*)", year as "(.*)", journal as "(.*)"$/) do
  |author, title, year, journal|
  fill_in "Author", with: author
  fill_in "Title", with: title
  fill_in "Year", with: year
  fill_in "Journal", with: journal
end

When(/^I click "(.*)"$/) do |link|
  click_button link
end

Then(/^(.*) has content (.*)$/) do |path, contents|
  visit path == "front page" ? '/' : path
  contents.split(" and ").all? { |word| assert page.has_content?(word[1...-1]) }
end
