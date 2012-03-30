Dir[ File.join(File.expand_path(__FILE__), '../metrics-java/jars/*.jar') ].each { |fi| require fi }

require 'slf4j'
require 'metrics-java/jars/log4j-1.2.16.jar'
require 'metrics-java/jars/metrics-core-3.0.0-SNAPSHOT.jar'
require 'metrics-java/jars/metrics-log4j-3.0.0-SNAPSHOT.jar'

require 'metrics-java/meter'
require 'metrics-java/histogram'
require 'metrics-java/timer'
require 'metrics-java/version'

module MetricsJ
  java_import 'java.util.concurrent.TimeUnit'
  java_import 'com.yammer.metrics.Metrics'
  java_import 'com.yammer.metrics.core.MetricName'

  class << self
    attr_accessor :app_name

    def app_name
      @app_name || "MyProject"
    end

    def time_unit_seconds
      TimeUnit::SECONDS
    end

    def time_unit_milliseconds
      TimeUnit::MILLISECONDS
    end

    # @param [String] group
    # @param [String] type
    # @param [String] name
    # @param [optional, String] scope
    # @return [com.yammer.metrics.core.MetricName]
    def create_metric_name(group, type, name, scope=nil)
      if scope
        MetricName.new(group, type, name, scope)
      else
        MetricName.new(group, type, name)
      end
    end
  end

end
