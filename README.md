# sshpa

[![Gem Version](https://badge.fury.io/rb/sshpa.svg)](https://badge.fury.io/rb/sshpa)

This is a management tool for logging into server base on sshpass.

## Installation

First you need to install sshpass lib to your system.

    //Installing on Ubuntu
    apt-get install sshpass

    //Installing on Mac
    brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

Then install it as:

    $ gem install sshpa


## Usage

First you need to run init script.

    $ sshpa init

Then edit the .sshpa.yml on your home path.

    $ vi ~/.sshpa.yml

Finally run command

    $ sshpa hostname1 //hostname1 is configured in .sshpa.yml

Login successful!!


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/happybai/sshpa.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

