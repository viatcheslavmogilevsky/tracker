require 'spec_helper.rb'

describe Task do

  describe 'validations' do
    before :all do
      @attr = {:title => "do something!", :content => "don't be lazzy!", :do_before => Date.today}
    end
    it "should have a title" do
      Task.new(@attr.merge(:title =>'')).should_not be_valid
    end
    it "should have a 'do before' date" do
      Task.new(@attr.merge(:do_before => nil)).should_not be_valid
    end
    it "normal task usually should be valid" do
       Task.new(@attr).should be_valid
    end
  end
end
