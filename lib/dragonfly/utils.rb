require 'tempfile'
require 'uri'

module Dragonfly
  module Utils

    module_function

    def new_tempfile(ext=nil, content=nil)
      tempfile = ext ? Tempfile.new(['dragonfly', ".#{ext}"]) : Tempfile.new('dragonfly')
      tempfile.binmode
      tempfile.write(content) if content
      tempfile.close
      tempfile
    end

    def symbolize_keys(hash)
      hash.inject({}) do |new_hash, (key, value)|
        new_hash[key.to_sym] = value
        new_hash
      end
    end

    def uri_escape_segment(string)
      URI.escape(string).sub('/', '%2F')
    end

    def uri_unescape(string)
      URI.unescape(string)
    end

  end
end
