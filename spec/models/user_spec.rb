require 'spec_helper.rb'

describe User do

  describe "validations" do

    before :each do
      @attr = {:name => "jack", :email => "some@email.com"}
    end

    it 'user should have a name' do
      @user = User.new(@attr.merge(:name => ''))
      @user.should_not be_valid
    end

    it 'user should have a email' do
      @user = User.new(@attr.merge(:email => ''))
      @user.should_not be_valid
    end

    it 'should reject names that are too long' do
      @user = User.new(@attr.merge(:name => 'x'*26))
      @user.should_not be_valid
    end

    it 'user should have a normal email' do
      @user = User.new(@attr.merge(:email => 'qwerty@.ru'))
      @user.should_not be_valid
    end

  end
end
