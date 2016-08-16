# -*- encoding: utf-8 -*-

require 'spec_helper'

describe DeviseMandrillMailer do

  
  describe '#reset_password_instructions' do
    it 'works' do
      devise_mandrill_mailer = DeviseMandrillMailer.new
      record = double('record')
      token = double('token')
      opts = double('opts')
      result = devise_mandrill_mailer.reset_password_instructions(record, token, opts)
      expect(result).not_to be_nil
    end
  end

  
  describe '#confirmation_instructions' do
    it 'works' do
      devise_mandrill_mailer = DeviseMandrillMailer.new
      record = double('record')
      token = double('token')
      opts = double('opts')
      result = devise_mandrill_mailer.confirmation_instructions(record, token, opts)
      expect(result).not_to be_nil
    end
  end

  
  describe '#unlock_instructions' do
    it 'works' do
      devise_mandrill_mailer = DeviseMandrillMailer.new
      record = double('record')
      token = double('token')
      opts = double('opts')
      result = devise_mandrill_mailer.unlock_instructions(record, token, opts)
      expect(result).not_to be_nil
    end
  end

  
  describe '#mandrill_send' do
    it 'works' do
      devise_mandrill_mailer = DeviseMandrillMailer.new
      options = double('options')
      result = devise_mandrill_mailer.mandrill_send(options)
      expect(result).not_to be_nil
    end
  end

end
