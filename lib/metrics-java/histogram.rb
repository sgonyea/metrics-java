require 'metrics-java'
require 'metrics-java/base_mixin'

module MetricsJ
  module Histogram
    java_import 'java.util.concurrent.TimeUnit'
    java_import 'com.yammer.metrics.Metrics'

    def self.extended(base)
      base.instance_exec {
        extend  MetricsJ::BaseMixin
      }
    end

    # @param [Symbol, String] histogram_name The name of the histogram
    # @return [com.yammer.metrics.core.MetricName] The MetricName that describes where the Metric data lives in JMX
    # @see MetricsJ.create_metric_name
    def histogram(histogram_name, bias=false)
      scoped_name = "#{histogram_name}_histogram"
      metric_name = MetricsJ.create_metric_name(metric_group, metric_type, histogram_name.to_s)

      new_histogram = Metrics.new_histogram(metric_name, bias)

      define_method(scoped_name) { new_histogram }

      new_histogram
    end
    
  end
end
