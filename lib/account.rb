# frozen_string_literal: true

class Account
  attr_reader :balance, :activity

  def initialize
    @balance = 0
    @activity = []
  end

  def withdraw(credit, date = Time.new.strftime('%d/%m/%Y'))
    raise 'Invalid input' if credit.negative? || credit.instance_of?(String)

    @balance -= credit
    @activity.unshift("#{date} || #{'%.2f' % credit} || || #{format('%.2f', @balance)}")
  end

  def deposit(debit, date = Time.new.strftime('%d/%m/%Y'))
    raise 'Invalid input' if debit.negative?

    @balance += debit
    @activity.unshift("#{date} || || #{'%.2f' % debit} || #{format('%.2f', @balance)}")
  end
end
