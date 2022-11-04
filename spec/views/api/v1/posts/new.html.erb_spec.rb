require 'rails_helper'

RSpec.describe "api/v1/posts/new", type: :view do
  before(:each) do
    assign(:api/v1_post, Api::V1::Post.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new api/v1_post form" do
    render

    assert_select "form[action=?][method=?]", api_v1_posts_path, "post" do

      assert_select "input[name=?]", "api/v1_post[title]"

      assert_select "textarea[name=?]", "api/v1_post[content]"
    end
  end
end
