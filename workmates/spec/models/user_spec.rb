require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(
      :user,
      name: 'testing',
      email: 'testing@email.com',
      password: 'test123',
      password_confirmation: 'test123'
    )
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'is invalid without a firstname' do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it 'is invalid without a email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it 'should not have to long name' do
    @user.name = 'a' * 51
    expect(@user).to_not be_valid
  end

  it 'should not have to long email' do
    @user.email = 'e' * 256
    expect(@user).to_not be_valid
  end

  it 'validates email' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
   invalid_addresses.each do |invalid_address|
     @user.email = invalid_address
     expect(@user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
   end
  end

  it 'checks for uniqness of email' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    duplicate_user.should_not be_valid
  end

  it 'should downcase emails' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end

  it 'should have presence of password (nonblank)' do
    @user.password = @user.password_confirmation = '' * 6
    expect(@user).to_not be_valid
  end

  it 'should test for password to have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user).to_not be_valid
  end
end
