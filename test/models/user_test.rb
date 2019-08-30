# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'John', email: 'john@email.com')
  end
  
  # User tests
  test 'user should be valid' do
    @user.valid?
  end
  # name
  test 'name shouldn\'t be empty' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name shouldn\'t be more than 100 chars' do
    @user.name = 'a' * 101
    assert_not @user.valid?
  end
  
  # email
  test 'email shouldn\'t be empty' do
    @user.email = ''
    assert_not @user.valid?
  end
  
  test 'email shouldn\'t be more than 255 chars' do
    @user.email = 'a' * 256
    assert_not @user.valid?
  end
  
  test 'email should save as downcase' do
    temp_email = "JOHN@gmail.com"
    @user.email = temp_email
    @user.save
    assert_equal temp_email.downcase, @user.reload.email
  end
  
  test 'email should be unique' do
    @user.save
    @user.reload
    duplicate = @user.dup
    assert_equal duplicate.save, false
  end  
  
  test 'email should be valid' do
    @user.email = 'John'
    @user.save
    assert_not @user.valid?
  end  
  
end
