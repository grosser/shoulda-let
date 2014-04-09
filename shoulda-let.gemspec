name = "shoulda-let"

Gem::Specification.new name, "0.0.5" do |s|
  s.summary = "A simple let for shoulda"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "MIT"
  s.add_runtime_dependency "shoulda"
end
