Given(/^I am viewing the show page of the first reference$/) do
  visit root_path
  first(:link, 'Show').click
end

Given(/^Tag "(.*)" is not showing$/) do |tag|
  assert !page.has_content?(tag)
end

When(/^I add the tag "(.*)"$/) do |tag|
  fill_in "article_all_tags", with: tag
  click_button 'Update Article'
end

Then(/^Tag "(.*)" is showing$/) do |tag|
  assert page.has_content?(tag)
end
