require 'metrics-java'
require 'metrics-java/base_mixin'

module MetricsJ
  module Meter
    java_import 'java.util.concurrent.TimeUnit'
    java_import 'com.yammer.metrics.Metrics'

    def self.extended(base)
      base.instance_exec {
        extend  MetricsJ::BaseMixin
      }
    end

    # @param [Symbol, String] meter_name The name of the meter
    # @return [com.yammer.metrics.core.MetricName] The MetricName that describes where the Metric data lives in JMX
    # @see MetricsJ.create_metric_name
    def meter(meter_name)
      scoped_name = "#{meter_name}_meter"
      metric_name = MetricsJ.create_metric_name(metric_group, metric_type, meter_name.to_s)

      new_meter = Metrics.new_meter(metric_name, meter_name.to_s, MetricsJ.time_unit_seconds)

      define_method(scoped_name) { new_meter }

      new_meter
    end

    def meters(*meter_names)
      meter_names.map!{ |meter_name| meter(meter_name) }
    end

  end
end
