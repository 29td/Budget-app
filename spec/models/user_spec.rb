require 'spec_helper'
require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'test', email: 'test@gmail.com')
  end

  describe 'user validation tests' do
    it 'validates the presence of the name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates the presence of the email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end
end