When(/^I have chosen filename "(.*)"$/) do |filename|
  fill_in "bibtex_name", with: filename
end

When(/^I press "(.*)"$/) do |button|
  click_button(button)
end

When(/^I have selected references$/) do
  first("input[type='checkbox']").set(true)
end

Then(/^I should get a download with the filename "(.*)"$/) do |filename|
  page.driver.response.headers['Content-Disposition'].include?("filename=\"#{filename}\"")
end
