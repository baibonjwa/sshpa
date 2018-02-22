# sshpa

[![Gem Version](https://badge.fury.io/rb/sshpa.svg)](https://badge.fury.io/rb/sshpa)

This is a management tool for logging into server base on sshpass.

## Installation

First you need to install sshpass lib to your system.

    //Installing on Ubuntu
    sudo apt-get install sshpass

    //Installing on Mac
    brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

Then install it as:

    $ gem install sshpa


## Usage

First you need to run init script.

    $ sshpa init

Then run 'sshpa add'.

    $ sshpa add [alias] [username] [password] [host]

Or edit the .sshpa.yml on your home path by yourself.

    $ vi ~/.sshpa.yml

Finally run command

    $ sshpa [alias] //[alias] is configured in the .sshpa.yml

Login successful!!

You also run 'sshpa list' to see the details of your host list.

    $ sshpa list

You can remove host by runing 'sshpa remove'.

    $ sshpa remove [alias]


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/happybai/sshpa.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

