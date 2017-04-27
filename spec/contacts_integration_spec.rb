require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact',{:type => :feature}) do
  it('processes user entry and returns add a contact page') do
    visit('/')
    click_on('Add Contact')
    expect(page).to have_content('Add a Contact:')
  end

  it('processes user entry and it to contact list') do
    visit('/contact/new')
    fill_in('first-name', :with => "Aaron")
    fill_in('last-name', :with => "Nguyen")
    fill_in('job-title', :with => "Student")
    fill_in('company', :with => "Epicodus")
    click_button('Add Contact')
    expect(page).to have_content('Aaron Nguyen')
  end
  it('processes user entry and it to contact list') do
    visit('/contacts')
    click_on('Aaron Nguyen')
    expect(page).to have_content('Name: Aaron Nguyen')
  end
  it('processes user entry and it to contact list') do
    visit('/contacts/1')
    fill_in('street', :with => "424th")
    fill_in('city', :with => "Enumclaw")
    fill_in('state', :with => "WA")
    fill_in('zipcode', :with => "98022")
    fill_in('address-type', :with => "Home")
    click_button('Add Address')
    expect(page).to have_content('Home : 424th, Enumclaw, WA, 98022')
  end
end
