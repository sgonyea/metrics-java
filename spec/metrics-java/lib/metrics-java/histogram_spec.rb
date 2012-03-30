require 'spec_helper'

describe MetricsJ::Histogram do
  class HistogramTest
    extend MetricsJ::Histogram

    histogram :foo
  end

  context "DSL" do
    let(:histogram_test) { HistogramTest.new }

    describe '.histogram' do
      it "should expose instance methods" do
        histogram_test.foo_histogram.should be_a com.yammer.metrics.core.Histogram
      end
    end
  end

end
