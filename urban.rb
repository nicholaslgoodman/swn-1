#!/usr/bin/env ruby
#
# urban.rb
# SWN NPC Generator
#
# Copyright (c) 2018 Nicholas Goodman <i@nicholasleegoodman.com>
# Copyright (c) 2014 Steve Simenic <orffen@orffenspace.com>
#
# This file is part of the SWN Toolbox.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require './unindent'
require 'yaml'

# This class generates an urban encounter from tables/urban.yaml, 
# which has the following attributes:
# - about (string)
# - venue (str)
# - involvement (str)
# - nature (str)
# - antagonists (str)
# - features (str)
#
class URBAN
  attr_reader :about, :venue, :involvement, :nature, :antagonists, :features

  def initialize
    yaml = YAML.load(File.read('tables/urban.yaml'))
    @about = yaml['about'].sample.to_str
    @venue = yaml['venue'].sample.to_str
    @involvement = yaml['involvement'].sample.to_str
    @nature = yaml['nature'].sample.to_str
    @antagonists = yaml['antagonist'].sample.to_str
    @feature = yaml['feature'].sample.to_str

  end

  def to_s
    <<-EOS.unindent
      |About: #{@about}
      |Venue: #{@venue}
      |Involvement: #{@involvement}
      |Nature: #{@nature}
      |Antagonists: #{@antagonists}
      |Features: #{@features}
      EOS
  end
end


if __FILE__ == $0
  Integer(ARGV.shift || 1).times do |e|
    puts '-----------+-+-+-----------' unless e.zero?
    puts URBAN.new
  end
end
