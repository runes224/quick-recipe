require 'rails_helper'

RSpec.describe Direction, type: :model do
  before do
    @direction = FactoryBot.create(:direction)
  end
  it "番号、内容があれば有効であること" do
    expect(@direction).to be_valid
  end
  it "番号がなければ無効であること" do
    direction = FactoryBot.build(:direction, number: nil)
    direction.valid?
    expect(direction.errors[:number]).to include('can\'t be blank')
  end
  it "内容がなければ無効であること" do
    direction = FactoryBot.build(:direction, content: nil)
    direction.valid?
    expect(direction.errors[:content]).to include('can\'t be blank')
  end
end
