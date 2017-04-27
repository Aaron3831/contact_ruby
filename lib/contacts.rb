class Address
  attr_reader(:street, :city, :state, :zipcode, :type, :id)

  @@addresses = []

  def initialize(attributes)
    @street = attributes[:street]
    @city = attributes[:city]
    @state = attributes[:state]
    @zipcode = attributes[:zipcode]
    @type = attributes[:type]
    @id = @@addresses.length() + 1
  end
  def save
    @@addresses.push(self)
  end

  def self.all
    @@addresses
  end

  def self.clear
    @@addresses = []
  end

  def address_formatted
    @street + ", " + @city + ", " + @state + ", " +  @zipcode

  end

  def self.find (id)
    found_address = nil
    @@addresses.each() do |address|
      if address.id() == id.to_i
        found_address = address
      end
    end
    found_address
  end
end

class Phone
  attr_reader(:area_code, :number, :type, :id)

  @@phones = []

  def initialize(attributes)
    @area_code = attributes[:area_code]
    @number = attributes[:number]
    @type = attributes[:type]
    @id = @@phones.length() + 1
  end
  def save
    @@phones.push(self)
  end

  def self.all
    @@phones
  end

  def self.clear
    @@phones = []
  end

  def phone_formatted
    @area_code + "-" + @number
  end

  def self.find (id)
    found_phone = nil
    @@phones.each() do |phone|
      if phone.id() == id.to_i
        found_phone = phone
      end
    end
    found_phone
  end
end

class Email
  attr_reader(:email_address, :type, :id)

  @@emails = []

  def initialize(attributes)
    @email_address = attributes[:email_address]
    @type = attributes[:type]
    @id = @@emails.length() + 1
    @email_formatted
  end

  def save
    @@emails.push(self)
  end

  def self.all
    @@emails
  end

  def self.clear
    @@emails = []
  end

  def self.find (id)
    found_email = nil
    @@emails.each() do |email|
      if email.id() == id.to_i
        found_email = email
      end
    end
    found_email
  end
end

class Contact
  attr_reader(:first_name, :last_name, :job_title, :company, :address, :phone, :email, :id)
  @@contacts = []
  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @job_title = attributes[:job_title]
    @company = attributes[:company]
    @address = []
    @phone = []
    @email = []
    @id = @@contacts.length() + 1
  end

  def save
    @@contacts.push(self)
  end

  def self.all
    @@contacts
  end

  def self.clear
    @@contacts = []
  end

  def add_address(address)
    @address.push(address)
  end

  def add_phone(phone)
    @phone.push(phone)
  end

  def add_email(email)
    @email.push(email)
  end

  def name_formatted
    @first_name + " " + @last_name

  end

  def self.find (id)
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id() == id.to_i
        found_contact = contact
      end
    end
    found_contact
  end
end
