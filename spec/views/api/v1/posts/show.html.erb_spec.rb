require 'rails_helper'

RSpec.describe "api/v1/posts/show", type: :view do
  before(:each) do
    @api/v1_post = assign(:api/v1_post, Api::V1::Post.create!(
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
