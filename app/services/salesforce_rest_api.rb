require 'restforce'
require 'uri'
require 'net/http'

class SalesforceRestApi
  attr_reader :client

  def initialize
    @client = Restforce.new(
      client_id: Rails.application.credentials[:sf_consumer_key],
      client_secret: Rails.application.credentials[:sf_consumer_secret],
      host: Rails.application.credentials[:sf_host],
      api_version: '61.0'
    )
  end

  def sobjects
    @client.describe
  end

  def sobject_names
    sobjects.pluck('name')
  end

  def list_users
    @client.query('SELECT Id, Name FROM User')
  end

  def list_accounts
    @client.query('Select Id, Name FROM Account')
  end

  def find_account(id: nil, name: nil)
    if id
      @client.find('Account', id)
    elsif name
      @client.query("select Id,Name from Account where Name = '#{name}'")
    end
  end

  def create_account(name:)
    @client.create('Account', Name: name)
  end

  def delete_account(id:)
    @client.destroy('Account', id)
  end
end
