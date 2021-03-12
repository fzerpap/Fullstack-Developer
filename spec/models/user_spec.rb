require 'rails_helper'

describe User do
  let!(:users) { create_list(:user,10) }
  let!(:admins) { create_list(:admin,2) }


  describe 'validations' do
    subject {users[0]}
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'methods users x role' do
    context "admin" do
      subject { User.admin.count }
      it { is_expected.to eq(2) }
    end
    context "no_admin" do
      subject { User.no_admin.count }
      it { is_expected.to eq(10) }
    end

  end
 
 describe 'method self.xrol' do
    context "" do
      subject { User.xrole }
      it { is_expected.to eq( [ {:role => 'admin', :number_users => 2}, {:role => 'no_admin', :number_users => 10} ]) }
    end

  end


end