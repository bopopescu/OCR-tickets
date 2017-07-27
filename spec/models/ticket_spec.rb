require 'rails_helper'

describe Ticket do
  it { should validate_presence_of :band }
  it { should validate_presence_of :venue }
  it { should validate_presence_of :city }
  it { should validate_presence_of :date }
end
