require "sshpa/version"
require 'yaml'

module Sshpa
  def self.hi *args
    case args[0]
    when 'init'
      if File.exist?(ENV['HOME']+'/.sshpa.yml')
        system 'echo ".sshpa.yml already exist."'
      else
        system 'echo ".sshpa.yml file has been created on $HOME."'
        system "cp #{File.expand_path(File.dirname(__FILE__))}/sshpa/.sshpa.yml.example $HOME/.sshpa.yml"
      end
    else
      if File.exist?(ENV['HOME']+'/.sshpa.yml')
        file = open(ENV['HOME']+'/.sshpa.yml').read
        config = YAML.load(file)[args[0]]
        command = "sshpass -p #{config['password']} ssh #{config['username']}\@#{config['host']}"
        puts command
        system command
      else
        puts '.sshpa.yml didn\'t exists.\n Please run \'sshpa init\' first.'
      end
    end
  end
end
