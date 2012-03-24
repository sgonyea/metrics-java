require 'metrics-java'
require 'metrics-java/base_mixin'

module MetricsJ
  module Meter
    java_import 'java.util.concurrent.TimeUnit'
    java_import 'com.yammer.metrics.Metrics'

    def self.extended(base)
      base.instance_exec {
        extend  MetricsJ::BaseMixin
        include MetricsJ::Meter::InstanceMethods
      }
    end

    # @return [com.yammer.metrics.core.MetricName] The MetricName that describes where the Metric data lives in JMX
    # @see MetricsJ.create_metric_name
    def scoped_meter(scope_name)
      scoped_name = "#{scope_name}_meter"
      metric_name = MetricsJ.create_metric_name(metric_group, metric_type, scope_name.to_s)

      new_meter = Metrics.new_meter(metric_name, scope_name.to_s, MetricsJ.time_unit_seconds)

      define_method(scoped_name) { new_meter }

      new_meter
    end

    module InstanceMethods
      # @todo
    end

  end
end
