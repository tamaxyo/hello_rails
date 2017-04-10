require 'rails_helper'

RSpec.describe Blog, type: :model do
  it "should be valid if title exists" do
    blog = Blog.new
    blog.title = "some title"
    expect(blog.valid?).to be_truthy
  end

  it "should not be valid if title does not exist" do
    blog = Blog.new
    expect(blog.valid?).to be_falsy
  end
end
