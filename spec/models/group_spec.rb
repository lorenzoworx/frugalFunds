require 'rails_helper'

RSpec.describe Group, type: :model do
  @test_user = User.create(name: 'John', email: 'admin@test.com', password: 'test12')
  @test_group = Group.new(author: @test_user, name: 'test product', icon: 'https://placehold.co/100x100')

  before { @test_group.save }
  it 'Should have a name present' do
    @test_group.name = nil
    expect(@test_group).to_not be_valid
  end

  it 'Should have an icon present' do
    @test_group.icon = nil
    expect(@test_group).to_not be_valid
  end
end
