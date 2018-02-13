# Courtesy https://gist.github.com/FluffyJack/6ecd13fda8ff9c6be879
module Motion
  class OpenStruct < BasicObject
    def initialize(hash)
      @struct = ::Struct.new(*hash.keys.map { |k| k.to_sym })
      @struct = @struct.new(*hash.values)
    end

    def ==(other)
      to_h == other.to_h
    end

    def method_missing(method_name, *args, &block)
      if method_name.to_s.index('=') && !@struct.respond_to?(method_name)
        vals = @struct.to_h.values
        getter_name = method_name.to_s.gsub('=', '')
        getters = ((@struct.to_h.keys.map { |k| k.to_sym }) + [getter_name.to_sym])
        @struct = ::Struct.new(*getters)
        @struct = @struct.new(*vals)
      end
      @struct.send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      return true if @struct.respond_to?(method_name)
      return true if super
    end
  end
end
