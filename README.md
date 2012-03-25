# Metrics

This is a primitive JRuby wrapper around [Coda Hale's Metrics library](https://github.com/codahale/metrics). It is very incomplete and still a work in progress. Feedback is appreciated.

This is only tested on JRuby, in --1.9 mode.

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

## Timers

```ruby
class Foo
  extend MetricsJ::Timer

  timer :bar

  def baz
    bar_timer {
      # Do something...
    }
  end
end
```

# Todo

Most everything, still:

- Gauges
- Counters
- Histograms
- Health Checks

In addition, there will be a Rails and a Sinatra/Padrino plugin that will hopefully hide most of these details.

Testing needs to be rounded out. This is may involve hooking into JMX to ensure that we behave correctly, all the way through the stack. Opinions welcome.
