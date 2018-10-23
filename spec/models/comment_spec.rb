require 'rails_helper'

RSpec.describe Comment, type: :model do

	let(:comment) { build(:comment) }

	describe 'Validation test' do

		describe '#content' do

			it 'is valid with content' do
				comment.content = '123?'
				expect(comment).to be_valid
			end

			describe 'is not valid without content' do
			
				it 'is nil' do
					comment.content = nil
					expect(comment).not_to be_valid
				end

				it 'is empty' do
					comment.content = ''
					expect(comment).not_to be_valid
				end

			end

		end

		describe '#project' do

			it 'should raise exception without project' do
				comment.project = nil
				expect(comment).to raise_error

			end
		end
		
	end

end
