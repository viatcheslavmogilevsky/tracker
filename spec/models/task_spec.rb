require 'spec_helper.rb'

describe Task do

  describe 'validations' do
    before :each do
      @attr = {:title => "do something!", :content => "don't be lazzy!", :do_before => Date.today}
    end
    it "should have a title" do
      @task = Task.new(@attr.merge(:title =>''))
      @task.should_not be_valid
    end
    it "should have a 'do before' date" do
      @task = Task.new(@attr.merge(:do_before => nil))
      @task.should_not be_valid
    end
    it "normal task usually should be valid" do
       Task.new(@attr).should be_valid
    end
  end
end
