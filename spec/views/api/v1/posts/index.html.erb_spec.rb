require 'rails_helper'

RSpec.describe "api/v1/posts/index", type: :view do
  before(:each) do
    assign(:api_v1_posts, [
      Api::V1::Post.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Api::V1::Post.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of api/v1/posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
