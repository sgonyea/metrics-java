require 'metrics-java'
require 'metrics-java/base_mixin'

module MetricsJ
  module Timer
    java_import 'java.util.concurrent.TimeUnit'
    java_import 'com.yammer.metrics.Metrics'

    def self.extended(base)
      base.instance_exec {
        extend  MetricsJ::BaseMixin
      }
    end

    # @param [Symbol, String] timer_name The name of the timer
    # @return [com.yammer.metrics.core.MetricName] The MetricName that describes where the Metric data lives in JMX
    # @see MetricsJ.create_metric_name
    def timer(timer_name)
      scoped_name = "#{timer_name}_timer"
      metric_name = MetricsJ.create_metric_name(metric_group, metric_type, timer_name.to_s)

      new_timer = Metrics.new_timer(metric_name, MetricsJ.time_unit_milliseconds, MetricsJ.time_unit_seconds)

      define_method(scoped_name) do |&block|
        if block
          context = new_timer.time

          begin
            block.call
          ensure
            context.stop
          end
        else
          new_timer
        end
      end

      new_timer
    end

    def timers(*timer_names)
      timer_names.map!{ |timer_name| timer(timer_name) }
    end

  end
end
