require 'rails_helper'

describe Comment do

  context 'methods' do
    describe 'validate markdown fields' do
      let(:comment) { create :comment }
      it 'description' do
        comment.update!(comment_markdown: '### The description')
        expect(comment.comment).to eq("<h3 id=\"the-description\">The description</h3>\n")
      end
    end
  end

end
