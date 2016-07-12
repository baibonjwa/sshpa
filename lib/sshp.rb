require "sshp/version"
require 'yaml'

module Sshp
  def self.hi *args
    case args[0]
    when 'init'
      if File.exist?(ENV['HOME']+'/.sshp.yml')
        system 'echo ".sshp.yml already exist."'
      else
        system 'echo ".sshp.yml file has been created on $HOME."'
        system "cp #{File.expand_path(File.dirname(__FILE__))}/sshp/.sshp.yml.example $HOME/.sshp.yml"
      end
    else
      if File.exist?(ENV['HOME']+'/.sshp.yml')
        file = open(ENV['HOME']+'/.sshp.yml').read
        config = YAML.load(file)[args[0]]
        command = "sshpass -p #{config['password']} ssh #{config['username']}\@#{config['host']}"
        puts command
        system command
      else
        puts '.sshp.yml didn\'t exists.\n Please run \'sshp init\' first.'
      end
    end
  end
end
