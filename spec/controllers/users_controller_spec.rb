require 'spec_helper.rb'

describe UsersController do
  render_views
  before :each do
    @attr = {:name => "Jeremy Clarckson", :email => "top@gear.com"}
    @user = Factory(:user)
  end

  it 'should redirect to new user after create' do
    lambda do
      post :create, :user => @attr
      @last_user = User.last
      response.should redirect_to user_path(@last_user)
    end.should change(User, :count).by(1)
  end

  it "should render 'new' action for invalid create" do
    lambda do
      post :create, :user => @attr.merge(:name=> "")
      response.should render_template('users/new')
    end.should_not change(User, :count)
  end

  it "should redirect to user for success update" do
    put :update, :user => @attr, :id => @user
    response.should redirect_to user_path(@user)
  end

  it "should render 'new' action for invalid update" do
    put :update, :user => @attr.merge(:name => ""), :id => @user
    response.should render_template('users/edit')
  end

  it "should redirect to users list after user delete" do
    lambda do
      delete :destroy, :id => @user
      response.should redirect_to users_path
    end.should change(User, :count).by(-1)
  end

end
