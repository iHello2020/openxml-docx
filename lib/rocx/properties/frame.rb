module Rocx
  module Properties
    class Frame
      include AttributeBuilder

      VALID_ANCHORS = %i(margin page text)
      VALID_DROP_CAPS = %i(drop margin none)
      VALID_HEIGHT_RULES = %i(atLeast auto exact)
      VALID_RELATIVE_HORIZONTAL_POSITIONS = %i(center inside left outside right)
      VALID_RELATIVE_VERTICAL_POSITIONS = %i(bottom center inline inside outside top)
      VALID_WRAPS = %i(around auto none notBeside through tight)

      attribute :anchor_lock, expects: :true_or_false, displays_as: :anchorLock
      attribute :drop_cap, expects: :valid_drop_cap, displays_as: :dropCap
      attribute :height, expects: :positive_integer, displays_as: :h
      attribute :height_rule, expects: :valid_height_rule, displays_as: :hRule
      attribute :horizontal_anchor, expects: :valid_anchor, displays_as: :hAnchor
      attribute :horizontal_padding, expects: :positive_integer, displays_as: :hSpace
      attribute :horizontal_position, expects: :integer, displays_as: :x
      attribute :lines, expects: :positive_integer
      attribute :relative_horizontal_position, expects: :valid_relative_horizontal_position, displays_as: :xAlign
      attribute :relative_vertical_position, expects: :valid_relative_vertical_position, displays_as: :yAlign
      attribute :vertical_anchor, expects: :valid_anchor, displays_as: :vAnchor
      attribute :vertical_padding, expects: :positive_integer, displays_as: :vSpace
      attribute :vertical_position, expects: :integer, displays_as: :y
      attribute :width, expects: :positive_integer, displays_as: :w
      attribute :wrap, expects: :valid_wrap

      def tag
        :framePr
      end

      def name
        "frame"
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def valid_drop_cap(name, value)
        valid_in? name, value, VALID_DROP_CAPS
      end

      def valid_anchor(name, value)
        valid_in? name, value, VALID_ANCHORS
      end

      def valid_height_rule(name, value)
        valid_in? name, value, VALID_HEIGHT_RULES
      end

      def valid_relative_horizontal_position(name, value)
        valid_in? name, value, VALID_RELATIVE_HORIZONTAL_POSITIONS
      end

      def valid_relative_vertical_position(name, value)
        valid_in? name, value, VALID_RELATIVE_VERTICAL_POSITIONS
      end

      def valid_wrap(name, value)
        valid_in? name, value, VALID_WRAPS
      end

    end
  end
end