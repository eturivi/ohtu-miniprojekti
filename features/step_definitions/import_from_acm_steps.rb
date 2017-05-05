Given(/^I am on the ACM import page$/) do
  visit import_from_acm_path
end

When(/^I enter the ([^ ]+) URL in the text field$/) do |type|
  urls = {
    'article' => 'http://dl.acm.org/citation.cfm?id=2716314&CFID=932671164&CFTOKEN=98385334',
    'book' => 'http://dl.acm.org/citation.cfm?id=2915031',
    'non-ACM' => 'https://github.com/mluukkai',
  }
  fill_in 'acm_link', with: urls[type]
end

When(/^I click on the import button$/) do
  click_button 'Import'
end

Then(/^(\w+) is successfully imported$/) do |type|
  authors = {
    'Article' => 'Kurhila, Jaakko; Vihavainen, Arto',
    'Book' => 'Zhai, ChengXiang; Massung, Sean',
  }
  assert page.has_content? 'Imported successfully.'
  assert_equal authors[type], type.constantize.last.author
end

Then(/^I get error message "([^"]*)"$/) do |message|
  assert page.has_content? message
end
