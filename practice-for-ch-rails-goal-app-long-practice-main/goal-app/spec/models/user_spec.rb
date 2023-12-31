# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'creates new users' do
    user1 = User.create!(username: 'username', password: 'password')
    user2 = User.create!(username: 'username2', password: 'password2')

    expect(User.all.length).to eq(2)
  end
end
