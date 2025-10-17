# base

A simple CLI to convert a binary data string representation between bases (hex, base32, base64).

## Installation

```bash
# Install dependencies
shards install

# Pick a destination
DEST="${HOME}/.local/bin"

crystal build --release -o "$DEST/base" src/base.cr
```

## Usage

```bash
Usage: base [options]
    -i, --input-base INPUT_BASE      Specify input base in [16, 32, 64]
    -o, --output-base OUTPUT_BASE    Specify output base in [16, 32, 64]
    -p, --padding                    Specify if output should be padded
    -u, --url-safe                   Specify if output should be url safe
    -h, --help                       Show this message
```

## Development

```bash
# Run tests
crystal spec
```

## Contributing

1. Fork it (<https://github.com/maximerety/base/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [maximerety](https://github.com/maximerety) - creator and maintainer
