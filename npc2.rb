#!/usr/bin/env ruby
#
# npc2.rb
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

# This class generates an NPC from tables/npc2.yaml, 
# which has the following attributes:
# - age (string)
# - background (str)
# - culture (str)
# - role (str)
# - problem (str)
# - desire (str)
# - trait (str)
# - gender (str)
# This class generates a name for the NPC from tables/npc_names/***.yaml
# where *** is the determined culture. It has the following attributes
# - Male (string)
# - Female (string)
# - last_name (string)
#
class NPC2
  attr_reader :age, :background, :culture, :role, :problem, :desire, :trait, 
    :first_name, :last_name

  def initialize
    yaml = YAML.load(File.read('tables/npc.yaml'))
    @age            = yaml['age'].sample.to_str
    @background	= yaml['background'].sample.to_str
    @culture	= yaml['culture'].sample.to_str
    @role = yaml['role'].sample.to_str
    @problem = yaml['problem'].sample.to_str
    @desire = yaml['desire'].sample.to_str
    @trait = yaml['trait'].sample.to_str
    @gender = yaml['gender'].sample.to_str

    names = YAML.load(File.read('tables/npc_names/'+@culture+'.yaml'))
    @first_name     = names[@gender].sample.to_str
    @last_name      = names['last_name'].sample.to_str
  end

  def to_s
    <<-EOS.unindent
      |Name: #{@first_name} #{@last_name}
      |Age: #{@age}
      |Background: #{@background}
      |Culture: #{@culture}
      |Role: #{@role}
      |Problem: #{@problem}
      |Desire: #{@desire}
      |Trait: #{@trait}
      |Gender: #{@gender}
      EOS
  end
end


if __FILE__ == $0
  Integer(ARGV.shift || 1).times do |e|
    puts '-----------+-+-+-----------' unless e.zero?
    puts NPC2.new
  end
end
