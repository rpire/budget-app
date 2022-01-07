require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      id: 1,
      name: 'Rubén Pire',
      email: 'rubenpire7@gmail.com',
      password: 'iloveburgers'
    )
  end

  before { subject.save }

  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
