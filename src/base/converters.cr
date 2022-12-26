require "base32"
require "base64"

require "./options"

module Base
  # Lambdas to convert :from the format to binary, or from binary :to the format
  CONVERTERS = {
    "16" => {
      from: ->(hex : String) { hex.hexbytes },
      to:   ->(binary : Bytes, opts : Options) { binary.hexstring },
    },
    "32" => {
      from: ->(base32 : String) {
        Base32.decode(base32.upcase)
      },
      to: ->(binary : Bytes, opts : Options) {
        Base32.encode(binary, opts.output_padding).downcase
      },
    },
    "64" => {
      from: ->(base64 : String) {
        Base64.decode(base64)
      },
      to: ->(binary : Bytes, opts : Options) {
        base64 = Base64.urlsafe_encode(binary, opts.output_padding)
        base64 = base64.tr("-_", "+/") unless opts.output_url_safe
        base64
      },
    },
  }
end
