require 'spec_helper'

describe MetricsJ::Meter do
  class MeterTest
    extend MetricsJ::Meter

    meter :foo
    meters :baz, 'bar'
  end

  context "DSL" do
    let(:meter_test) { MeterTest.new }

    describe '.meter' do
      it "should expose instance methods" do
        meter_test.foo_meter.should be_a com.yammer.metrics.core.Meter
      end
    end

    describe '.meters' do
      it "should expose instance methods" do
        meter_test.baz_meter.should be_a com.yammer.metrics.core.Meter
        meter_test.bar_meter.should be_a com.yammer.metrics.core.Meter
      end
    end
  end
end
