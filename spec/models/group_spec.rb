require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    User.create(
      id: 1,
      name: 'Rubén Pire',
      email: 'rubenpire7@gmail.com',
      password: 'iloveburgers'
    )
  end

  subject do
    Group.new(
      author_id: 1,
      name: 'Burger Bar',
      icon: 'burger_bar.png'
    )
  end

  before { subject.save }

  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'checks for the presence of "icon"' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
