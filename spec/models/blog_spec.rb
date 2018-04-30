require 'rails_helper'

RSpec.describe Blog, type: :model do

  context 'methods' do
    describe 'validate markdown fields' do
      let(:blog) { create :blog }
      it 'description' do
        blog.update!(body_markdown: '### The description')
        expect(blog.body).to eq("<h3 id=\"the-description\">The description</h3>\n")
      end
    end
  end

end
