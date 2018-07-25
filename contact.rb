class Contact

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    self.all.each do |x|
      if x.id == id
        return x
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    attribute.downcase!
    if attribute == "first_name"
      self.first_name = value.capitalize
    elsif attribute == "last_name"
      self.last_name = value.capitalize
    elsif attribute == "email"
      self.email = value
    elsif attribute == "note"
      self.note = value
    else
      puts "Error"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    attribute.downcase!
    if attribute == "first_name"
      @@contacts.each do |contact|
        if contact.first_name.downcase == value.downcase
          return contact
        end
      end
    elsif attribute == "last_name"
      @@contacts.each do |contact|
        if contact.last_name.downcase == value.downcase
          return contact
        end
      end
    elsif attribute == "email"
      @@contacts.each do |contact|
        if contact.email == value
          return contact
        end
      end
    elsif attribute == "note"
      @@contacts.each do |contact|
        if contact.note == value
          return contact
        end
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contact = []
  end


  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
