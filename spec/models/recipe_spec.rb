require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.create(:recipe)
  end
  it "名前、説明、手順、作成者があれば有効であること" do
    expect(@recipe).to be_valid
  end
  it "名前がなければ無効であること" do
    recipe = FactoryBot.build(:recipe, name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include('can\'t be blank')
  end
end
