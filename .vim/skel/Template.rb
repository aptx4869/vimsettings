#!/usr/bin/env ruby
#-*-encoding:utf-8-*-

#-------------------------------------------------
#     Author: <T_AUTHOR> <<T_AUTHOR_EMAIL>>
#     <T_AUTHOR_WEBSITE>
#
#     File: <T_FILENAME>
#     Create Date: <T_CREATE_DATE>
#-------------------------------------------------

require 'optparse'

options = {}
OptionParser.new do |opts|
	opts.banner = "Usage: #{File.basename(__FILE__)} [options]"
  opts.on('-l Locale', '--locale Locale', 'Use the specify language') do |locale|
    options[:locale] = locale
  end
end.parse!
