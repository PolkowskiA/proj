require 'rails_helper'

RSpec.describe Project, type: :model do

	let(:project) {create(:project)}
	
	describe 'validation test' do

		describe '#name' do

			it 'is valid with name' do				
				expect(project).to be_valid
			end

			it 'is not valid without name (nil)' do
				project.name = nil
				expect(project).not_to be_valid
			end

			it 'is not valid without name (empty)' do
				project.name = ''
				expect(project).not_to be_valid
			end

		end

		describe '#description is valid if:'do

			it 'empty' do
				project.description = ''
				expect(project).to be_valid
			end

			it 'has content' do
				expect(project).to be_valid
			end

		end

		describe 'user' do
			it 'is valid if projct has user' do
				expect(project.user).not_to be nil
			end

			it 'is not valid without user' do
				project.user = nil
				expect(project).not_to be_valid
			end
		end

	end

	describe 'atrributes response to...' do

		it 'name' do
			expect(subject).to respond_to(:name)
		end

		it 'description' do
			expect(subject).to respond_to(:description)
		end

		it 'user' do
			expect(subject).to respond_to(:user)
		end
	end

end