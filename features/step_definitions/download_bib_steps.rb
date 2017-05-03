When(/^Filename field is empty$/) do
#toteuta filename-kenttä ensin
end

#When(/^I have chosen filename "(.*)"$/) do
#end

Then(/^I should get a download with the filename "(.*)"$/) do |filename|
  page.driver.response.headers['Content-Disposition'].include?("filename=\"#{filename}\"")
end
