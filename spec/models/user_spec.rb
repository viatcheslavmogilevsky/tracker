require 'spec_helper.rb'

describe User do

  describe "validations" do

    before :all do
      @attr = {:name => "jack", :email => "some@email.com"}
    end

    it 'user should have a name' do
      User.new(@attr.merge(:name => '')).should_not be_valid
    end

    it 'user should have a email' do
      User.new(@attr.merge(:email => '')).should_not be_valid
    end

    it 'should reject names that are too long' do
      User.new(@attr.merge(:name => 'x'*26)).should_not be_valid
    end

    it 'user should have a normal email' do
      User.new(@attr.merge(:email => 'qwerty@.ru')).should_not be_valid
    end

    it 'normal user usually should be valid' do
      User.new(@attr).should be_valid
    end

  end
end
