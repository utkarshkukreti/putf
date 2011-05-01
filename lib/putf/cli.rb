module Putf
  class CLI
    attr_reader :options

    def initialize(argv)
      @options = Slop.parse!(argv, :help => true) do
        banner "Putf Help"
        on 't', 'to', 'The server you want to upload to. Add/edit them using `putf config` or in ~/.putfrc', true, :default => :default
      end

      if argv.empty?
        puts @options.help
      elsif argv.first == 'config'
        Putf::Config.cli(argv[1] || 'default')
      else
        upload(argv.first)
      end
    end

    def upload(file)
      expanded_path = File.expand_path(file)
      server = Config.get(@options[:to])

      host = server[:host]
      username = server[:username]
      password = server[:password]
      directory = server[:directory]
      url = server[:url]

      puts "Uploading #{expanded_path} to #{username}@#{host}:#{directory} (#{options[:to]})"

      if password == ""
        ssh = Net::SSH.start(host, username)
      else
        ssh = Net::SSH.start(host, username, :password => password)
      end

      ssh.scp.upload(expanded_path, directory)

      ssh.close

      puts "Uploaded #{expanded_path} to #{url}/#{File.basename(expanded_path)}"

    end
  end
end
