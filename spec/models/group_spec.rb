require 'rails_helper'

RSpec.describe Group, type: :model do
  @test_user = User.create(name; 'John', email: 'admin@test.com', password: 'test12')
  subject = { Group.new(author: @test_user, name: 'test product', icon: 'https://placehold.co/100x100') }

  before { subject.save }
  it 'Should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should have an icon present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
