module RubyMotionQuery
  module Stylers
    class UIViewStyler

      def corner_radius=(value)
        @view.layer.cornerRadius = value
      end
      def corner_radius
        @view.layer.cornerRadius
      end

    end
  end
end