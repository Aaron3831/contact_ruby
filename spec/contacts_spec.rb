require('rspec')
require('contacts')

describe('Address') do
  describe("#attr_accessor") do
    it("will return address information") do
      test_address = Address.new({:street=> "424th St.", :city=> "Enumclaw", :state=> "WA", :zipcode=> "98022", :type=> "Home"})
      expect(test_address.street()).to eq("424th St.")
      expect(test_address.city()).to eq("Enumclaw")
      expect(test_address.state()).to eq("WA")
      expect(test_address.zipcode()).to eq("98022")
      expect(test_address.type()).to eq("Home")
    end
  end
end


describe('Phone') do
  describe("#attr_accessor") do
    it("will return phone information") do
      test_phone = Phone.new({:area_code=> 360, :number=> 8253831, :type=> "Home"})
      expect(test_phone.area_code()).to eq(360)
      expect(test_phone.number()).to eq(8253831)
      expect(test_phone.type()).to eq("Home")
    end
  end
end

describe('Email') do
  describe("#attr_accessor") do
    it("will return email information") do
      test_email = Email.new({:email_address=> "aaron3831@gmail.com", :type=> "Personal"})
      expect(test_email.email_address()).to eq("aaron3831@gmail.com")
      expect(test_email.type()).to eq("Personal")
    end
  end
end

describe('Contact') do
  before() do
   Contact.clear()
  end
  describe("#attr_accessor") do
    it("returns contact information") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      expect(test_contact.first_name()).to eq("Bob")
      expect(test_contact.last_name()).to eq("Smith")
      expect(test_contact.job_title()).to eq("Manager")
      expect(test_contact.company()).to eq("Epicodus")
      expect(test_contact.address()).to eq([])
      expect(test_contact.phone()).to eq([])
      expect(test_contact.email()).to eq([])
      expect(test_contact.id()).to eq(1)
    end
  end

  describe(".all") do
     it "return emty array of contacts" do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      expect(Contact.all()).to eq([])
     end
  end

  describe("#save") do
    it "return list of contacts" do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      test_contact.save()
      expect(Contact.all()).to eq([test_contact])
    end
  end

  describe(".clear") do
    it "empties out all of the saved contacts" do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      test_contact.save()
      Contact.clear()
      expect(Contact.all()).to eq([])
    end
  end

  describe(".find") do
    it("returns a contact by it's id number") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      test_contact.save()
      expect(Contact.find(test_contact.id())).to eq(test_contact)
    end
  end

  describe("#add_address") do
    it("returns a contact with address array") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      test_address = Address.new({:street=> "424th St.", :city=> "Enumclaw", :state=> "WA", :zipcode=> "98022", :type=> "Home"})
      test_contact.add_address(test_address)
      test_contact.save()
      expect(Contact.all()).to eq([test_contact])
    end
  end

  describe("#add_phone") do
    it("returns a contact with phone array") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name=> "Smith", :job_title=> "Manager", :company=> "Epicodus"})
      test_phone = Phone.new({:area_code=> 360, :number=> 8253831, :type=> "Home"})
      test_contact.add_phone(test_phone)
      test_contact.save()
      expect(Contact.all()).to eq([test_contact])
    end
  end
end
