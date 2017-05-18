require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  it "pages#contact" do
    get '/pages/contact'
    expect(response).to render_template(:contact)
  end

  it "pages#privacy" do
    get '/pages/privacy'
    expect(response).to render_template(:privacy)
  end

  it "pages#terms" do
    get '/pages/terms'
    expect(response).to render_template(:terms)
  end

end
