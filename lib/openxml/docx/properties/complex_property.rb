require "openxml/has_attributes"

module OpenXml
  module Docx
    module Properties
      class ComplexProperty < BaseProperty
        include HasAttributes

        def to_xml(xml)
          return unless render?
          xml[namespace].public_send(tag, xml_attributes)
        end

        def render?
          !xml_attributes.empty?
        end

      end
    end
  end
end
