HTTPerf::Grapher
================

### [Documentation](http://rubyops.github.com/httperfrb-grapher/doc/) | [Coverage](http://rubyops.github.com/httperfrb-grapher/coverage/) | [RSpec Out](https://github.com/rubyops/httperfrb-grapher/blob/master/RSPECOUT.md)


### WARNINGS

This may or may not be working at this moment -- this is still very much beta.

You can use this with my version of [httperf](https://github.com/rubyops/httperf), which adds the necessary output. *This is very experimental, so use at your own risk.* 

If your verbose output contains the following type of output, this will work for you:

        Connection lifetime = 719.5
        Connection lifetime = 575.5
        Connection lifetime = 285.5
        Connection lifetime = 156.5
        Connection lifetime = 400.5
        Connection lifetime = 145.5
        Connection lifetime = 349.5
        Connection lifetime = 583.5
        Connection lifetime = 147.5
        Connection lifetime = 138.5


You will also know if HTTPerf::Grapher is usable if your HTTPerf parsed results contain the following keys:

        :connection_times
        :connection_time_75_pct
        :connection_time_80_pct
        :connection_time_85_pct
        :connection_time_90_pct
        :connection_time_95_pct
        :connection_time_99_pct


## Installing 'rubyops httperf'

#### See: [httperf-0.9.1 with individual connection times](http://www.rubyops.net/2012/08/13/httperf-0_9_1_with_individual_connection_times) for installation instructions.

## Installing 'httperfrb'

#### See: [HTTPerf.rb](http://www.rubyops.net/gems/httperfrb)

## Usage - HTTPerf

#### See: [HTTPerf.rb](http://www.rubyops.net/gems/httperfrb)

## Usage - HTTPerf::Grapher

        httperf_graph = HTTPerf::Grapher.new
        httperf_graph.output_file = "/tmp/httperf_graph.png"
        
        #
        # httperf_graph.graph_settings = { ... overide Gruff defaults }
        # 
       
        httperf_graph.graph( HTTPerf::Parser( httperf_verbose_results ) ) 

### Example Image

![rspec result image](https://raw.github.com/rubyops/httperfrb-grapher/master/httperf_test.png)
