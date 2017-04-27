require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('pry')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contact/new') do
  erb(:contact_form)
end

post('/contacts') do
  @contacts = Contact.all()
  first_name = params.fetch("first-name")
  last_name = params.fetch("last-name")
  job_title = params.fetch("job-title")
  company = params.fetch("company")
  contact = Contact.new({:first_name=> first_name, :last_name=> last_name, :job_title=> job_title, :company=> company})

  street = params.fetch("street")
  city = params.fetch("city")
  state = params.fetch("state")
  zipcode = params.fetch("zipcode")
  address_type = params.fetch("address-type")

  address = Address.new({:street=> street, :city=> city, :state=> state, :zipcode=> zipcode, :type=> address_type})

  contact.add_address(address)

  area_code = params.fetch("area-code")
  number = params.fetch("number")
  phone_type = params.fetch("phone-type")

  phone = Phone.new({:area_code=> area_code, :number=> number, :type=> phone_type})

  contact.add_phone(phone)

  email = params.fetch("address-email")
  email_type = params.fetch("email-type")

  email = Email.new({:email_address=> email, :type=> email_type})

  contact.add_email(email)

  contact.save()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end
