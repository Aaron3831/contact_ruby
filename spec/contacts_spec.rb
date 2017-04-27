require('rspec')
require('contacts')

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
end

describe('Address') do
  describe("#attr_accessor") do
    it("will return address information") do
      test_address = Address.new({:street=> "424th St.", :city=> "Enumclaw", :state=> "WA", :zipcode=> "98022", :type=> "Home"})
      expect(test_address.street()).to eq("424th St.")
      expect(test_address.city()).to eq("Enumclaw")
      expect(test_address.state()).to eq("WA")
      expect(test_address.zipcode()).to eq("98022")
      expect(test_address.type()).to eq("Home")
      expect(test_address.id()).to eq(1)
    end
  end
end
