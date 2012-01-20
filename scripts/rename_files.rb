#!/usr/bin/env ruby

Dir.entries(".").each do |f|
  next if f.start_with?(".")
  next unless f.end_with?(".md")
  next if File.directory?(f)

  lines = File.readlines(f)
  lines.each do |l|
    if l.start_with?("Slug: ")
      new_filename = l.gsub( /^Slug: /, "" ).gsub( "/", "-" ).strip + ".md"
      `git mv #{f} #{new_filename}`
      next
    end
  end
end
