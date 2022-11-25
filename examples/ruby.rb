module JsonApi
  class Renderer
    class Document
      def initialize(params = {})
        @data = params.fetch(:data, :no_data)
        @include = params.fetch(:include, {})
      end

      def to_hash
        @hash ||= document_hash
      end

      private

      def document_hash
        {}.tap do |hash|
          hash.merge!(data_hash) if @data != :no_data
        end
      end

      def data_hash
        resource = Formatter.new.process(Array(@data), @include)
        {}.tap do |hash|
          hash[:data] = @data.respond_to?(:to_ary) ? resource : resource[0]
        end
      end
    end
  end
end

