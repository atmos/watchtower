require File.dirname(__FILE__) + '/spec_helper'

describe "hitting the root url" do

  it "works" do
    response = get '/'
    response.should be_successful
    response.should have_selector("#sidebar > #logo", :content => 'Watchtower')
    response.should have_selector("#main > ul.events")
  end

  it 'polls and upates' do
    response = get '/poll'

    response.body.should_not be_empty

    response = get '/poll'
    response.body.should be_empty
  end

end
