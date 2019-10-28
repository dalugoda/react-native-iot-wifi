require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |spec|
  spec.name             = 'react-native-iot-wifi'
  spec.version          = '1.0.2'
  spec.license          =  'MIT'
  spec.summary          = 'summary'
  spec.homepage         = 'https://github.com/josectobar/react-native-iot-wifi'
  spec.authors          = { 'Jose tobar' => 'josectobar@gmail.com' }
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/josectobar/react-native-iot-wifi.git", :tag => "#{spec.version}" }
  spec.source_files  = "ios/**/*.{h,m}"
end 