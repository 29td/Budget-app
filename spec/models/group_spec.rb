require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @file = fixture_file_upload('masive.png', 'image/png')
    @user = User.new(name: 'test', email: 'test@gmail.com')
    @group = Group.new(name: 'Leslie Pies', image: @file, author_id: @user.id)
    @group.records.new(name: 'Apple Pie', amount: 5, author_id: @user.id, group_id: @group.id)
  end

  describe 'group validation tests' do
    it 'validate the presence of the name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'validate the presence of the image' do
      @group.image = nil
      expect(@group).to_not be_valid
    end

    it 'validate the presence of the author_id' do
      @group.author_id = nil
      expect(@group).to_not be_valid
    end
  end

  describe 'group model methods tests' do
    it 'returns all records for the group' do
      expect(@group.total_records).to eq(1)
    end
  end
end
