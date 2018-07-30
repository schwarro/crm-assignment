require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter the first name: '
    first_name = gets.chomp.downcase

    print 'Enter the last name: '
    last_name = gets.chomp.downcase

    print 'Enter email address: '
    email = gets.chomp.downcase

    print 'Enter a note: '
    note = gets.chomp.downcase

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )

    contact.save
    puts "\e[H\e[2J"
  end

  def modify_existing_contact
    print 'Enter the first name of the contact you would like to update: '
    name = gets.chomp.downcase

    print 'Please enter what you would like to change: '
    attribute = gets.chomp.downcase

    print 'Please enter the new value: '
    value = gets.chomp.downcase

    contact = Contact.find_by('first_name' => name)
    contact.update(attribute => value)

    puts "\e[H\e[2J"

    p contact
  end

  def delete_contact
    print "Please enter the first name of the contact you would like to delete: "
    name = gets.chomp.downcase
    contact = Contact.find_by('first_name' => name)
    contact.delete

    puts "\e[H\e[2J"

  end

  def display_all_contacts
    puts "\e[H\e[2J"
    p Contact.all
  end

  def search_by_attribute
    print "Enter the attribute that you would like to search by: "
    attribute = gets.chomp.downcase

    print "Enter the value of the selected attribute: "
    value = gets.chomp.downcase

    contact = Contact.find_by(attribute => value)
    puts "\e[H\e[2J"
    p contact
  end

end

crm1 = CRM.new('this is my first crm')
crm1.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
