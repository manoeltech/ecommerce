require 'rails_helper'
require_relative '../../app/models/validators/future_date_validator'

class Validator
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validator.new }

  context "when date is before current date" do
    before { subject.date = 1.day.ago }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "Adds on errors in model" do
      subject.valid?
      expect(subject.errors.key?(:date)).to be_truthy
    end
  end

  context "when date is equal current date" do
    before { subject.date = Time.zone.now }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "Adds on errors in model" do
      subject.valid?
      expect(subject.errors.key?(:date)).to be_truthy
    end
  end

  context "when date is greater than current date" do
    before { subject.date = Time.zone.now + 1.day }

    it "should be valid" do
      expect(subject.valid?).to be_truthy
    end
  end
end
