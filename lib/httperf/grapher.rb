$:.unshift File.dirname(__FILE__)
require 'httperf'
require 'httperf/parser'
require 'grapher'
require 'grapher/version'
require 'gruff'
class HTTPerf
  class Grapher
    attr_accessor :output_file
    attr_reader   :graph_settings

    def initialize gs={}
      @output_file    = "httperf_graph.png"
      @graph_settings = default_graph_settings.merge(gs)
    end

    def graph_settings=(s)
      @graph_settings = graph_settings.merge(s)
    end

    def graph results
      raise "missing connection times, ensure that you have the correct version of httperf installed and it was run verbosely -- see documentation at http://github.com/rubyops/httperfrb-grapher" unless results.has_key?(:connection_times)
      graph = Gruff::Line.new 

      conn_times = results[:connection_times].map { |i| i.to_f }

      graph_settings.each do |key,val|
        graph.send("#{key}=".to_sym, val)
      end

      graph.data("Connection Times", conn_times)
      graph.data("Average [#{results[:connection_time_avg].to_f}]", draw_line(results[:connection_time_avg].to_f, conn_times.count))
      graph.data("85th [#{results[:connection_time_85_pct].to_f}]", draw_line(results[:connection_time_85_pct].to_f, conn_times.count))
      graph.data("95th [#{results[:connection_time_95_pct].to_f}]", draw_line(results[:connection_time_95_pct].to_f, conn_times.count))
      graph.data("99th [#{results[:connection_time_99_pct].to_f}]", draw_line(results[:connection_time_99_pct].to_f, conn_times.count))

      graph.labels = {}
      (1..(conn_times.count/10)).each do |i|
        graph.labels[i*10] = (i*10).to_s
      end

      graph.write(output_file)
    end

    private
    def default_graph_settings
      {
        hide_dots:        true,
        legend_font_size: 14,
        marker_font_size: 14,
        title:            "HTTPerf Results"
      }
    end
    def draw_line value, length
      (1..length).collect { value }
    end
  end
end

