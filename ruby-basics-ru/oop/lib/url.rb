require 'uri'
require 'forwardable'

class Url
  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI.parse(url)
    @query_params = parse_query(@uri.query)
  end

  def query_params
    @query_params
  end

  def query_param(key, default_value = nil)
    @query_params[key] || default_value
  end

  def ==(other)
    return false unless other.is_a?(Url)
    scheme == other.scheme &&
      host == other.host &&
      port == other.port &&
      query_params_sorted == other.query_params_sorted
  end

  protected

  def query_params_sorted
    @query_params.sort.to_h
  end

  private

  def parse_query(query)
    return {} if query.nil? || query.empty?
    query.split('&').map { |pair| pair.split('=') }.to_h
  end
end
