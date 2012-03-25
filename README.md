# Metrics

This is a primitive JRuby wrapper around [Coda Hale's Metrics library](https://github.com/codahale/metrics). It is very incomplete and still a work in progress. Feedback is appreciated.

# How to Use

Somewhere during the initialization of your app, you should set the name of your app. If you do not, it will default to "MyProject"

```ruby
MetricsJ.app_name = "Foo App"
```

You can view the metrics that your app is collecting by running `jconsole` from the command line. Select your JRuby app and navigate to the "MBeans" tab.

## Meters

```ruby
class Foo
  extend MetricsJ::Meter

  meter :bar

  def baz
    bar_meter.mark
    # Do something...
  end

end
```

# Todo

Most everything, still:

- Gauges
- Counters
- Histograms
- Timers
- Health Checks

In addition, there will be a Rails and a Sinatra/Padrino plugin that will hopefully hide most of these details.
