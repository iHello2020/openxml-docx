require "spec_helper"

describe OpenXml::Docx::Properties::Strikethrough do
  include ValuePropertyTestMacros

  it_should_use tag: :strike, name: "strikethrough"

  with_value(true) do
    it_should_work
    it_should_output "<w:strike w:val=\"true\"/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
