require 'content-preview'

class Router
  def initialize(path='routes.yml')
    @routes = YAML.load_file path
  end

  def call(env)
    path = env['PATH_INFO']
    until @routes.has_key? path do
      path = path.rpartition('/').first
      path = '/' if path.empty?
    end

    require File.dirname(__FILE__) + '/' + @routes[path]

    class_name = @routes[path].capitalize
    Kernel.const_get(class_name).call env
  end
end