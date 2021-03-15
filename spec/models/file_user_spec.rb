require 'rails_helper'

describe FileUser do
  let(:file_users_valids) { create(:file_users_valids) }
  let(:file_users_invalids) { create(:file_users_invalids) }
  let(:file_users_with_errors) { create(:file_users_with_errors) }
  let(:file_users_excell_invalid) { create(:file_users_excell_invalid) }

 
  describe 'validations' do
    subject {file_users_valids}
    it { should validate_presence_of(:name) }
  end

  describe 'methods import_users' do
    context "all users are valids from excell" do
      subject {file_users_valids.import_users[:users_total] }
      it { is_expected.to eq(5) }
      
      subject {file_users_valids.import_users[:users_valids] }
      it { is_expected.to eq(5) }
      
      subject {file_users_valids.import_users[:users].count }
      it { is_expected.to eq(5) }
    end

    context "some users are valids and others invalids, from excell" do
      subject {file_users_with_errors.import_users[:users_valids] }
      it { is_expected.to eq(4) }

      subject {file_users_with_errors.import_users[:users_total] }
      it { is_expected.to eq(5) }
      
    end

    context "all users are invalids from excell" do
      subject {file_users_invalids.import_users[:users_total] }
      it { is_expected.to eq(5) }
      
      subject {file_users_invalids.import_users[:users_valids] }
      it { is_expected.to eq(0) }
      
    end

    context "excell file invalid" do
      subject {file_users_excell_invalid.import_users[:total_users] }
      it { is_expected.to eq(4) }
      
      subject {file_users_excell_invalid.import_users[:users_valids] }
      it { is_expected.to eq(0) }

      subject {file_users_excell_invalid.import_users[:users] }
      it { is_expected.to eq(nil) }
      
     end


  end
 
end