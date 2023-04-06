# frozen_string_literal: true

module Utils
  module Callable
    extend ActiveSupport::Concern

    class_methods do
      def call(*args, **kwargs, &block)
        new(*args, **kwargs).call(&block)
      end
    end

    included do
      def call
        raise NotImplementedError
      end
    end
  end
end
