# frozen_string_literal: true

require_relative '../value_equality'
require_relative 'change'

module RubyTerraform
  module Models
    class OutputChange
      include ValueEquality

      attr_reader(:name)

      def initialize(name, content)
        @name = name
        @content = content
      end

      def change
        Change.new(@content)
      end

      def create?
        change.create?
      end

      def update?
        change.update?
      end

      def delete?
        change.delete?
      end

      def present_before?
        update? || delete?
      end

      def present_after?
        create? || update?
      end

      def inspect
        to_h.inspect
      end

      def to_h
        { @name => @content }
      end

      def state
        [@name, @content]
      end
    end
  end
end
