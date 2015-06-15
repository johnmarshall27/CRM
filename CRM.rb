require_relative('rolodex.rb')

class CRM
  attr_reader :name

  def self.run(name)
    my_crm = CRM.new(name)
    my_crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] modify a contact"
    puts "[3] display all"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_all_contacts
    when 4 then display_attribute
    when 5 then delete_contact
    when 6 then puts "Goodbye"
      exit
    else
      puts "I cannot perform that function"
    end
  end

  def main_menu
    puts "Welcome to #{@name}"
    while true
      print_main_menu

      print "Select and option: "
      input = gets.chomp.to_i
      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact"

    print "First Name: "
    first_name = gets.chomp

    print "Last Name: "
    last_name = gets.chomp

    print "Email Address: "
    email = gets.chomp

    print "notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def edit_contact
    puts "would you like to change the name?"

    print "New First Name: "
    first_name = gets.chomp

    print "New Last Name: "
    last_name = gets.chomp

    print "New Email Address: "
    email = gets.chomp

    print "New notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def display_all
    @rolodex.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}"
    end
  end
  def display_attribute
  end
  def delete_contact
  end
end
CRM.run("Bitmaker CRM")
