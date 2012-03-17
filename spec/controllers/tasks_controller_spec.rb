require 'spec_helper.rb'

describe TasksController do

    before :each do
      @user = Factory(:user)
      @attr = {:title => "do", :content => "telephasic shop", :do_before => Date.today+1}
      @task = Factory(:task, :user => @user)
    end

    it "should redirect to user show after create" do
      lambda do
        post :create, :task => @attr, :user_id => @user
        response.should redirect_to user_path(@user)
      end.should change(Task, :count).by(1)
    end

    it "should redirect to user show after delete" do
      lambda do
        delete :destroy, :id =>  @task, :user_id => @user
        response.should redirect_to user_path(@user)
      end.should change(Task, :count).by(-1)
    end

    it "should render 'new' action for invalid create" do
      lambda do
        post :create, :task => @attr.merge(:title => ""), :user_id => @user
        response.should render_template('tasks/new')
      end.should_not change(Task, :count)
    end

    it "should redirect to user for valid update" do
      put :update, :id => @task, :task => @attr, :user_id => @user
      response.should redirect_to user_path(@user)
    end

    it "should render 'edit' action for invalid update" do
      put :update, :id => @task, :task => @attr.merge(:title => ""), :user_id => @user
      response.should render_template('tasks/edit')
    end

    it "should redirect to user for set_complete action" do
      put :set_complete, :id => @task, :user_id => @user
      response.should redirect_to user_path(@user)
    end
end
