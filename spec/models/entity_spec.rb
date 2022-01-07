require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    User.create(
      id: 1,
      name: 'Rubén Pire',
      email: 'rubenpire7@gmail.com',
      password: 'iloveburgers'
    )
  end

  subject do
    Entity.new(
      author_id: 1,
      name: 'Big Ugly Burger',
      amount: 4.99
    )
  end

  before { subject.save }

  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'chacks for the numericality of "amount"' do
    subject.amount = 'almost 5 USD'
    expect(subject).to_not be_valid
  end

  it 'checks that "amount is not negative"' do
    subject.amount = -4.99
    expect(subject).to_not be_valid
  end
end
