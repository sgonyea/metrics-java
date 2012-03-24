require 'metrics-java'

module MetricsJ
  module BaseMixin
    attr_writer   :metric_group, :metric_type
    attr_accessor :metric_name

    # @return [String] The group name to use for the metrics being collected
    def metric_group
      @metric_group ||= MetricsJ.app_name
    end

    # @return [String] The group name to use for the metrics being collected
    def metric_type
      @metrics_type ||= self.name
    end

    # @return [com.yammer.metrics.core.MetricName] The MetricName that describes where the Metric data lives in JMX
    # @see MetricsJ.create_metric_name
    def metric_name
      @metric_name ||= MetricsJ.create_metric_name(metric_group, metric_type, metric_name)
    end
  end
end
