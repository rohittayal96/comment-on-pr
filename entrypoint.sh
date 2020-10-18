#!/usr/bin/env ruby

require "json"
require "octokit"

json = File.read(ENV.fetch("GITHUB_EVENT_PATH"))
echo $json
event = JSON.parse(json)

github = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])

if !ENV["GITHUB_TOKEN"]
  puts "Missing GITHUB_TOKEN"
  exit(1)
end

if ARGV[0].empty?
  puts "Missing message argument."
  exit(1)
end

message = ARGV[0]
echo $message
repo = event["repository"]["full_name"]
echo $repo

pr_number = event["number"]
echo $pr_number

github.add_comment(repo, pr_number, message)
