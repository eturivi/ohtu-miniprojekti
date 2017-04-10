Given(/^I am at (.*)$/) do |page_path|
  visit page_path
end

Given(/^I have filled in author as "(.*)", title as "(.*)", year as "(.*)"$/) do |author, title, year|
  fill_in "Author", with: author
  fill_in "Title", with: author
  fill_in "Year", with: author
end

When(/^I click "(.*)"$/) do |link|
  click_button link
end

Then(/^(.*) has content (.*)$/) do |path, contents|
  visit path == "front page" ? '/' : path

  for word in contents.split(" and ").map { |w| w.scan(/"(.*)"/)[0][0] }
    page.has_content?(word)
  end
end
