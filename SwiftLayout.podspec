Pod::Spec.new do |s|
  s.name             = "SwiftLayout"
  s.version          = "3.0.0"
  s.summary          = "A Swift library for programmatically dealing with AutoLayout"
  s.homepage         = "https://github.com/shaps80/SwiftLayout"
  s.license          = 'MIT'
  s.author           = { "Shaps Mohsenin" => "shapsuk@me.com" }
  s.source           = { :git => "https://github.com/shaps80/SwiftLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shaps'
  s.platforms = { :ios => "8.0", :osx => "10.10" }
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*.swift'
end
