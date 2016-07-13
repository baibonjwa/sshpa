# sshp

This is a management tool for ssh login server base on sshpass.

## Installation

First you need install sshpass lib to your system.

    //Installing on Ubuntu
    apt-get install sshpass

    //Installing on Mac
    brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

Then install it as:

    $ gem install sshp


## Usage

First you need run init script.

    $ sshp init

Then edit the .sshp.yml on your home path.

    $ vi ~/.sshp.yml

Finally run command

    $ sshp hostname1

Login success!!


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/happybai/sshp.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

