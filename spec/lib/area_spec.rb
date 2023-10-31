require "spec_helper"
require "area"

# All tests pending for initial commit

describe Area, ".plot_ascii_array" do
  let(:ascii_graph) do
    raw = <<-EOV
         *
        **
       ***
      ****
      ----
      0123
    EOV

    # stole from `ActiveSupport::CoreExt::String#strip_heredoc`
    raw.gsub(/^#{raw.scan(/^[ \t]*(?=\S)/).min}/, "".freeze)
  end

  it "prints a graph" do
    expect {
      Area.plot_ascii_array([1, 2, 3, 4])
    }.to output(ascii_graph).to_stdout
  end
end

describe Area, ".max" do
  it "returns 2 for [1,1,8]" do
    inputs = [1, 1, 8]
    Area.plot_ascii_array(inputs)
    analysis = Area.max(inputs)
    expect(analysis.max_area).to eq(2)
  end

  it "returns 2 for [1,2,8]" do
    inputs = [1, 2, 8]
    Area.plot_ascii_array(inputs)
    analysis = Area.max(inputs)
    expect(analysis.max_area).to eq(2)
  end

  it "returns 16 for [8, 8, 8]" do
    inputs = [8, 8, 8]
    Area.plot_ascii_array(inputs)
    analysis = Area.max(inputs)
    expect(analysis.max_area).to eq(16)
  end

  it "returns 24 for [8, 8, 8, 9]" do
    inputs = [8, 8, 8, 9]
    Area.plot_ascii_array(inputs)
    analysis = Area.max(inputs)
    expect(analysis.max_area).to eq(24)
  end

  it "returns 49 for [1,8,6,2,5,4,8,3,7]" do
    inputs = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    Area.plot_ascii_array(inputs)
    analysis = Area.max(inputs)
    expect(analysis.max_area).to eq(49)
  end
end
