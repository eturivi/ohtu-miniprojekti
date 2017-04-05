Given(/^I am at (.*)$/) do |page_path|
  visit page_path
end

Given(/^(\w*) is filled in with "(.*)"$/) do |label, content|
  fill_in label, with: content
end

When(/^I click "(.*)"$/) do |link|
  save_and_open_page
  click_button link
end

Then(/^page "(.*)" has content "(.*)"$/) do |url, content|
  visit url
  page.has_content?(content)
end
