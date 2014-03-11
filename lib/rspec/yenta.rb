require "rspec/yenta/version"

module RSpec
  module Yenta
    # Your code goes here...
    module_function

    def load_tasks(&config)
      require "rake"
      TaskHelper.new(&config).install
    end

    class TaskHelper
      include Rake::DSL if defined? Rake::DSL
      attr_reader :config
      def initialize(&config_block)
        @config = config_block
      end

      def install
        desc "Find all of your rspec matchers and output them to STDOUT"
        task "yenta" do

          config.call if config.respond_to?(:call)

          $SHOW_MATCHERS = {}
          rspec_matcher_namespaces = []

          require 'rspec'

          begin
            require 'rspec/matchers'
          rescue LoadError => e
            STDERR << "Unable to load rspec-rails matchers. Yenta may not find all of your matcher.\n"
          end
          if defined?(::RSpec::Matchers)
            rspec_matcher_namespaces << ::RSpec::Matchers
          end

          begin
            require 'rspec/rails/matchers'
          rescue LoadError => e
            STDERR << "Unable to load rspec-rails matchers. Yenta may not find all of your matcher.\n"
          end
          if defined?(::RSpec::Rails::Matchers)
            rspec_matcher_namespaces << ::RSpec::Rails::Matchers
          end

          rspec_matcher_namespaces.each do |namespace|
            namespace.instance_methods.sort.each do |method_name|
              unless $SHOW_MATCHERS.has_key?(method_name)
                $SHOW_MATCHERS[method_name] = namespace.instance_method(method_name).source_location
              end
            end
          end

          method_name_size = 0
          $SHOW_MATCHERS.each{|k,v|
            method_name_size = k.length if k.length > method_name_size
          }

          $SHOW_MATCHERS.sort.each {|k,v|
            puts "%-#{method_name_size}s\t%s" % [k, v.join(":")]
          }
        end
      end
    end
  end
end
