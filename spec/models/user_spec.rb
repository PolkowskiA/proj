require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { build(:user) }

	describe 'Validation test' do

		describe '#name :' do

				context 'when length :'do

					it 'is to short' do
						user.name = 'Yes'
						expect(user).not_to be_valid
					end

					it 'is empty' do
						user.name = nil
						expect(user).not_to be_valid
					end
				end

				context 'when length is' do

					it 'ok' do
						user.name = 'Quill'
						expect(user).to be_valid
					end
				end
		end

		describe '#email' do

			context 'when #email is not valid' do
				it 'is no local-part' do
					user.email = '@qwe.com'
					expect(user).not_to be_valid
					
				end

				it 'is no domain provaider' do
					user.email = 'qwe@.com'
					expect(user).not_to be_valid
					
				end

				it 'is no domain ending ' do
					user.email = 'qwe@qwe.'
					expect(user).not_to be_valid
				end

				it 'is no email' do
					user.email = nil
					expect(user).not_to be_valid
				end

				it 'is #email not match' do
					user.email = '!#$%^&*dsa@!@#$.com'
					expect(user).not_to be_valid
				end
			end

			context 'when #email ' do
				it 'is ok' do
					user.email = 'shogun@gmail.com'
					expect(user).to be_valid
				end
			end
		end

		describe '#password' do

			it 'is not valid without password' do
				user.password = nil
				expect(user).not_to be_valid
			end

			it 'is not valid without too short password (<6 char.)' do
				user.password = '12345'
				expect(user).not_to be_valid
			end

			it 'is valid with correct password (>=6 char.)' do
				user.password = '12345678'
				expect(user).to be_valid
			end


		end


	describe 'Attributes test' do

		it 'has name attribute' do
			expect(user).to respond_to(:name) 	
		end

		it 'has email attribute' do
			expect(user).to respond_to(:email) 	
		end

		it 'has password attribute' do
			expect(user).to respond_to(:password) 	
		end

		end
	end
end