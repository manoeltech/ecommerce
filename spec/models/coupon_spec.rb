require 'rails_helper'

RSpec.describe Coupon, type: :model do
  subject { build(:coupon) }

  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code).case_insensitive }

  it { is_expected.to validate_presence_of(:discount_value) }
  it { is_expected.to validate_numericality_of(:discount_value).is_greater_than(0)}

  it { is_expected.to validate_presence_of(:due_date) }  

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to define_enum_for(:status).with_values({ active: 1, inactive: 2 })}

  it "can't have past due_date" do
    subject.due_date = 1.day.ago
    subject.valid?
    expect(subject.errors.key?(:due_date)).to be_truthy
  end
  
  it "is invalid with current due_date" do
    subject.due_date = Time.zone.now
    subject.valid?
    expect(subject.errors.key?(:due_date)).to be_truthy
  end
  
  it "is valid with future date" do
    subject.due_date = Time.zone.now + 1.hour
    subject.valid?
    expect(subject.errors.key?(:due_date)).to be_falsey
  end
end
