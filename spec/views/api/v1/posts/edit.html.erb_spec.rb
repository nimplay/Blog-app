require 'rails_helper'

RSpec.describe "api/v1/posts/edit", type: :view do
  before(:each) do
    @api/v1_post = assign(:api/v1_post, Api::V1::Post.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit api/v1_post form" do
    render

    assert_select "form[action=?][method=?]", api/v1_post_path(@api/v1_post), "post" do

      assert_select "input[name=?]", "api/v1_post[title]"

      assert_select "textarea[name=?]", "api/v1_post[content]"
    end
  end
end
