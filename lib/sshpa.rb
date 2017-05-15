require "sshpa/version"
require 'yaml'
require 'optparse'

module Sshpa
  def self.main
    options = {}

    opt_parser = OptionParser.new do |opt|
      opt.banner = "Usage: sshpa COMMAND [OPTIONS]"
      opt.separator  ""
      opt.separator  "Commands"
      opt.separator  "     add: add a server"
      opt.separator  "     list: list servers"
      opt.separator  "     remove: remove a server"
      opt.separator  "     init: init sshpa config"
      opt.separator  ""
      opt.separator  "Options"

      opt.on("-v","--version","") do |environment|
        puts "v#{VERSION}"
        exit
      end

      #opt.on("-f","--forever","runing on daemon mode?") do
        #options[:daemon] = true
      #end
    end

    opt_parser.parse!

    case ARGV[0]
    when "add"
      puts "call start on options #{options.inspect}"
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
    when "list"
      puts "call stop on options #{options.inspect}"
      if File.exist?("#{ENV['HOME']}/.sshpa.yml")
        file = open(ENV['HOME']+'/.sshpa.yml').read
        puts file.to_yaml
      else
        puts '.sshpa.yml didn\'t exists.\n Please run \'sshpa init\' first.'
      end
    when "remove"
      file = open(ENV['HOME'] + '/.sshpa.yml').read
      config = YAML.load(file)
      puts config.delete(args[1]) { |el| "#{el} not found" }
      output = YAML.dump config
      File.write(ENV['HOME'] + '/.sshpa.yml', output)
      puts "The #{args[1]} has been removed successfully"
    when "init"
      if File.exist?(ENV['HOME']+'/.sshpa.yml')
        system 'echo ".sshpa.yml already exist."'
      else
        system 'echo ".sshpa.yml file has been created on $HOME."'
        system "cp #{File.expand_path(File.dirname(__FILE__))}/sshpa/.sshpa.yml.example $HOME/.sshpa.yml"
      end
    else
      if (ARGV.length == 0)
        puts opt_parser
      else
        begin
          if File.exist?(ENV['HOME']+'/.sshpa.yml')
            file = open(ENV['HOME']+'/.sshpa.yml').read
            config = YAML.load(file)[ARGV[0]]
            #config = YAML.load(file)
            command = "sshpass -e ssh -o StrictHostKeyChecking=no #{config['username']}\@#{config['host']}"
            puts command
            ENV['SSHPASS'] = config['password']
            system command
          else
            puts '.sshpa.yml didn\'t exists.\n Please run \'sshpa init\' first.'
          end
        rescue
          puts 'Alias didn\'t exists or argument is not correct'
        end
      end
    end
  end
end
