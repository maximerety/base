require "option_parser"

class Options
  property input_base, output_base, output_padding, output_url_safe

  def initialize
    @input_base = ""
    @output_base = ""
    @output_padding = false
    @output_url_safe = false
  end

  def self.parse!(bases)
    opts = self.new

    OptionParser.parse do |parser|
      parser.banner = "Usage: base [options]"

      parser.on("-i", "--input-base INPUT_BASE", "Specify input base in #{bases.inspect.gsub("\"", "")}") do |i|
        abort "Expected input base in #{bases.inspect.gsub("\"", "")} but was #{i}" unless bases.includes?(i)
        opts.input_base = i
      end

      parser.on("-o", "--output-base OUTPUT_BASE", "Specify output base in #{bases.inspect.gsub("\"", "")}") do |o|
        abort "Expected output base in #{bases.inspect.gsub("\"", "")} but was #{o}" unless bases.includes?(o)
        opts.output_base = o
      end

      parser.on("-p", "--padding", "Specify if output should be padded") do
        opts.output_padding = true
      end

      parser.on("-u", "--url-safe", "Specify if output should be url safe") do
        opts.output_url_safe = true
      end

      parser.on("-h", "--help", "Show this message") do
        puts parser
        exit
      end
    end

    abort "Missing mandatory option -i, --input-base" if opts.input_base.empty?

    return opts
  end
end
