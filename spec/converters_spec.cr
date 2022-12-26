require "./spec_helper"

describe Base::CONVERTERS do
  # Use test vectors from RFC 4648, but with lowercase base32 variant
  # See: https://www.rfc-editor.org/rfc/rfc4648#page-12
  test_vectors = {
    {"string": "", "16": "", "32": "", "64": ""},
    {"string": "f", "16": "66", "32": "my======", "64": "Zg=="},
    {"string": "fo", "16": "666f", "32": "mzxq====", "64": "Zm8="},
    {"string": "foo", "16": "666f6f", "32": "mzxw6===", "64": "Zm9v"},
    {"string": "foob", "16": "666f6f62", "32": "mzxw6yq=", "64": "Zm9vYg=="},
    {"string": "fooba", "16": "666f6f6261", "32": "mzxw6ytb", "64": "Zm9vYmE="},
    {"string": "foobar", "16": "666f6f626172", "32": "mzxw6ytboi======", "64": "Zm9vYmFy"},
  }

  bases = Base::CONVERTERS.keys

  test_vectors.each do |vector|
    bases.each do |input_base|
      bases.each do |output_base|
        options = Options.new
        options.output_padding = true

        it "converts the binary representation of string \"#{vector["string"]}\" from base #{input_base} to base #{output_base}" do
          input_data = vector[input_base]
          input_converter = Base::CONVERTERS[input_base][:from]
          output_data = vector[output_base]
          output_converter = Base::CONVERTERS[output_base][:to]
          output_converter.call(input_converter.call(input_data), options).should eq(output_data)
        end
      end
    end
  end
end
