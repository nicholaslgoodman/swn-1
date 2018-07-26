#!/usr/bin/env ruby
#
# patron.rb
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

# This class generates an NPC from tables/npc.yaml, 
# which has the following attributes:
#
# - eagerness (string)
# - trustworthiness (string)
# - job (string)
# - problem (string)
# - rewards (string)
# - complication (string)
#
class PATRON 
  attr_reader :eagerness, :trustworthiness, :job, :problem, :rewards, :complication 

  def initialize
    yaml = YAML.load(File.read('tables/patron.yaml'))
    @eagerness         = yaml['eagerness'].sample.to_str
    @trustworthiness            = yaml['trustworthiness'].sample.to_str
    @job        = yaml['job'].sample.to_str
    @problem         = yaml['problem'].sample.to_str
    @rewards       = yaml['rewards'].sample.to_str
    @complication = yaml['complication'].sample.to_str

  end

  def to_s
    <<-EOS.unindent
      |Eagerness: #{@eagerness}
      |Trustworthiness: #{@trustworthiness}
      |Job: #{@job}
      |Problem: #{@problem}
      |Rewards: #{@rewards}
      |Complication: #{@complication}
      EOS
  end
end


if __FILE__ == $0
  Integer(ARGV.shift || 1).times do |e|
    puts '-----------+-+-+-----------' unless e.zero?
    puts PATRON.new
  end
end
