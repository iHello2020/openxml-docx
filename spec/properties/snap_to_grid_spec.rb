require "spec_helper"

describe OpenXml::Docx::Properties::SnapToGrid do
  include ValuePropertyTestMacros

  it_should_use tag: :snapToGrid, name: "snap_to_grid", value: true

  with_value(:on) do
    it_should_work
    it_should_output "<w:snapToGrid w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:snapToGrid w:val=\"off\"/>"
  end

  with_value(true) do
    it_should_work
    it_should_output "<w:snapToGrid/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:snapToGrid w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
