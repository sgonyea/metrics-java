require 'spec_helper'

describe MetricsJ::Timer do
  class TimerTest
    extend MetricsJ::Timer

    timer :foo
    timers :baz, 'bar'
  end

  context "DSL" do
    describe '.timer' do
      it "should expose instance methods" do
        timer_test = TimerTest.new

        timer_test.foo_timer.should be_a com.yammer.metrics.core.Timer
      end
    end

    describe '.timers' do
      it "should expose instance methods" do
        timer_test = TimerTest.new

        timer_test.baz_timer.should be_a com.yammer.metrics.core.Timer
        timer_test.bar_timer.should be_a com.yammer.metrics.core.Timer
      end
    end
  end
end
