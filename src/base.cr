require "./base/*"

module Base
  def self.run!
    newline = false
    opts = Options.parse!(CONVERTERS.keys)

    while input = gets
      input = input.chomp

      if input.empty?
        newline = false
        next
      end

      input_converter = CONVERTERS[opts.input_base][:from]
      binary = input_converter.call(input)

      if !opts.output_base.empty?
        output_converter = CONVERTERS[opts.output_base][:to]
        output = output_converter.call(binary, opts)
        print "#{newline ? "\n" : ""}#{output}"
      else
        print "#{newline ? "\n" : ""}base#{opts.input_base} input: #{input}"
        CONVERTERS.each do |base, converter|
          output_converter = converter[:to]
          output = output_converter.call(binary, opts)
          print "\n  -> base#{base}: #{output}"
        end
      end

      newline = true
    end
  end
end

Base.run!
