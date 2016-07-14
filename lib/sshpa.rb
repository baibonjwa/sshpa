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
    when 'list'
      if File.exist?(ENV['HOME']+'/.sshpa.yml')
        file = open(ENV['HOME']+'/.sshpa.yml').read
        puts file.to_yaml
      else
        puts '.sshpa.yml didn\'t exists.\n Please run \'sshpa init\' first.'
      end
    when 'add'
      if args.length != 5
        puts 'The number of argument is wrong.'
      else
        file = open(ENV['HOME'] + '/.sshpa.yml').read
        config = YAML.load(file)
        key = args[1].to_s
        config[key] = {}
        config[key]['username'] = args[2]
        puts config
        config[key]['password'] = args[3]
        puts config
        config[key]['host'] = args[4]
        puts config
        output = YAML.dump config
        File.write(ENV['HOME'] + '/.sshpa.yml', output)
        puts "The #{args[1]} has been added successfully"
      end
    when 'remove'
      file = open(ENV['HOME'] + '/.sshpa.yml').read
      config = YAML.load(file)
      puts config.delete(args[1]) { |el| "#{el} not found" }
      output = YAML.dump config
      File.write(ENV['HOME'] + '/.sshpa.yml', output)
      puts "The #{args[1]} has been removed successfully"
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
