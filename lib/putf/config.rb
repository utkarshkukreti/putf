module Putf
  class Config
    CONFIG_FILE = File.expand_path("~/.putfrc")

    def self.load
      FileUtils.touch(CONFIG_FILE) unless File.exist?(CONFIG_FILE)
      @all ||= YAML.load_file(CONFIG_FILE) || {}
    end

    def self.get(name = 'default')
      load
      @all[name.to_sym]
    end

    def self.cli(name)
      load
      current = @all[name.to_sym]
      puts "Configuring #{current ? '' : 'new '}putf profile: #{name}"
      new = current || {}
      print "host? "
      new[:host] = ask
      print "username? "
      new[:username] = ask
      print "password? (leave blank to use public key auth)"
      new[:password] = ask
      print "directory? (relative to home, or absolute path. blank for home dir)"
      new[:directory] = ask
      print "url? (base url, to which the file name will be appended)"
      new[:url] = ask
      @all[name.to_sym] = new
      dump
    end

    def self.dump
      File.open(CONFIG_FILE, 'w') do |f|
        f << YAML.dump(@all)
      end
    end

    def self.ask
      STDIN.gets.chomp
    end
  end
end
