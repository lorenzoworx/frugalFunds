require 'rails_helper'

RSpec.describe Product, type: :model do
  @test_user = User.create(name: 'Tom', email: 'admin@test.com', password: 'test12' )
  subject { Product.new(author: @test_user, name: 'test-product', amount: 35) }

  before { subject.save }
  it 'Should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should only accept an amount greater than or equal to zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
