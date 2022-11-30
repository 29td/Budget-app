require 'spec_helper'
require "rails_helper"


RSpec.describe Record, type: :model do
  before(:each) do
    @file = fixture_file_upload('masive.png', 'image/png')
    @user = User.new(id: 5, name: 'test', email: 'test@gmail.com')
    @group = Group.new(id: 5, name: 'Leslie Pies', image: @file, author_id: @user.id)
    @record = @group.records.new(name: 'Apple Pie', amount: 5, author_id: @user.id, group_id: @group.id)
  end

  describe 'validation tests' do
    it 'validates the author_id is present' do
      expect(@record.author_id).to eq(5)
    end

    it 'validates the group_id is present' do
      expect(@record.group_id).to eq(5)
    end

    it 'validates the record exists' do
      expect(@record.name).to eq('Apple Pie')
    end
  end
end