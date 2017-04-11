require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe 'GET #index' do
    it "should load all blogs" do
      get :index
      expect(assigns(:blogs)).to eq Blog.all
    end
  end

  describe 'POST #create' do
    it "should create a new blog" do
      expect{
        post :create, params: {blog: {title: 'test'}}
      }.to change(Blog, :count).by(1)
    end
    it "should be redirected to show after the blog creation" do
      post :create, params: { blog: {title: 'sample blog'}}
      expect(response).to redirect_to blog_path Blog.last
    end
  end
end
