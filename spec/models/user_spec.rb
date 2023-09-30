require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', email: 'john@test.com', password: 'test12') }

  before { subject.save }
  it 'Should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should have an email address present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
