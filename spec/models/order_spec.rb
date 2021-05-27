require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に間違いがない場合' do
    it "priceがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に不備がある場合' do
    it 'priceが空では保存できないこと' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
  end
end
