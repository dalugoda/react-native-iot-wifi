require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name         = package['react-native-iot-wifi']
  s.version      = package['1.0.1']
  s.summary      = package['description']
  s.license      = package['MIT License']

  s.authors      = package['authors']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/josectobar/react-native-iot-wifi.git", :tag => "#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"
end 