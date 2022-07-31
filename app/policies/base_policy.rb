# frozen_string_literal: true

class BasePolicy
  QUESTION_MARK = '?'
  private_constant :QUESTION_MARK

  def self.method_missing(method, *args, &block)
    return super unless respond_to_missing?(method)

    new(*args).public_send(method)
  end

  def self.respond_to_missing?(method, include_private = false)
    method.to_s.end_with?(QUESTION_MARK) || super
  end

  def initialize(object)
    @object = object
  end

  private

  attr_reader :object
end
