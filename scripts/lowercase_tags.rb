#!/usr/bin/env ruby

Dir.entries(".").each do |f|
  next if f.start_with?(".")
  next unless f.end_with?(".md")
  next if File.directory?(f)

  lines = File.readlines(f)
  lines.map do |l|
    if l.start_with?("Tags: ")
      l.downcase!
      l[0] = l[0].capitalize
    end
    l
  end

  File.open( f, "w" ) do |f|
    f.puts lines.join
  end
end
