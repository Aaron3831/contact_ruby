class Contact
  attr_accessor(:first_name, :last_name, :job_title, :company, :address, :phone, :email, :id)
  @@contacts = []
  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    # @address = attributes.fetch(:address)
    # @phone = attributes.fetch(:phone)
    # @email = attributes.fetch(:email)
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

class Address
  attr_accessor(:street, :city, :state, :zipcode, :type, :id)

  @@addresses = []

  def initialize(attributes)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zipcode = attributes.fetch(:zipcode)
    @type = attributes.fetch(:type)
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
