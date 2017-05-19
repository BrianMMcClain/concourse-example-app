require 'json'

fScan = File.read('scan.json')
results = JSON.parse(fScan)

# results["records"][0]["vulnerabilities"][0]["cvssScore"]

results["records"][0]["vulnerabilities"].each do |r|
    if r["cvssScore"] > 7
        puts "High Risk CVSS Score: #{r['cvssScore']}"
        puts JSON.pretty_generate(r)
        exit 1
    end
end
