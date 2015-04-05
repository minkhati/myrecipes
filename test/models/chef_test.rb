require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "saumya", email: "saumya@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  test "email length should be within bound" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD_DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.ca]
    valid_addresses.each do |email|
      @chef.email = email
      assert @chef.valid?, "#{email.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses"  do
    invalid_addresses = %w[usereee@ffs,uuu R_TDD_DS&org user..com first.last.au laura+joek.%ca]
    invalid_addresses.each do |iemail|
      @chef.email = iemail
      assert_not @chef.valid?, "#{iemail.inspect} should be invalid"
    end
  end
end
