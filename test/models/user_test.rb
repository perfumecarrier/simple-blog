require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test 'password_and_password_confirmation_should_match' do
    @user = User.new(name: 'cali', email: 'cali@yare', password: '123456', password_confirmation: '123456')
    assert @user.valid?
  end

  test 'password_min_length_six_digits' do
    @user = User.new(name: 'cali', email: 'cali@yare', password: '12345')
    assert_not @user.valid?
  end
end
