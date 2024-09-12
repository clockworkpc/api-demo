require 'rails_helper'

RSpec.describe HibpApi do
  before do
    @service = described_class.new
  end

  describe 'Password' do
    it 'checks whether "password123" has been pwnd', focus: false do
      res = @service.pwnd_password?('password123')
      expect(res[:found]).to be true
    end
  end

  describe 'Email Account' do
    it 'checks whether personal account has been pwnd', focus: false do
      email = ENV.fetch('TEST_EMAIL_ACCOUNT', nil)
      res = @service.pwnd_email_account?(email:)
      expect(res[:found]).to be true
    end
  end
end
