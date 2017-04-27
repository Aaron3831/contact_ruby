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

  if street !="""" && city !="""" && state != """" && zipcode != """" && address_type != """"
    address = Address.new({:street=> street, :city=> city, :state=> state, :zipcode=> zipcode, :type=> address_type})
    contact.add_address(address)
  end

  area_code = params.fetch("area-code")
  number = params.fetch("number")
  phone_type = params.fetch("phone-type")

  if area_code !="""" && number !="""" && phone_type != """"
    phone = Phone.new({:area_code=> area_code, :number=> number, :type=> phone_type})
    contact.add_phone(phone)
  end

  email = params.fetch("address-email")
  email_type = params.fetch("email-type")

  if email !="""" && email_type !=""""
    email = Email.new({:email_address=> email, :type=> email_type})
    contact.add_email(email)
  end

  contact.save()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end

post('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  street = params.fetch("street")
  city = params.fetch("city")
  state = params.fetch("state")
  zipcode = params.fetch("zipcode")
  address_type = params.fetch("address-type")

  if street !="""" && city !="""" && state != """" && zipcode != """" && address_type != """"
    address = Address.new({:street=> street, :city=> city, :state=> state, :zipcode=> zipcode, :type=> address_type})
    @contact.add_address(address)
  end

  area_code = params.fetch("area-code")
  number = params.fetch("number")
  phone_type = params.fetch("phone-type")

  if area_code !="""" && number !="""" && phone_type != """"
    phone = Phone.new({:area_code=> area_code, :number=> number, :type=> phone_type})
    @contact.add_phone(phone)
  end

  email = params.fetch("address-email")
  email_type = params.fetch("email-type")

  if email !="""" && email_type !=""""
    email = Email.new({:email_address=> email, :type=> email_type})
    @contact.add_email(email)
  end
  erb(:contact)
end
