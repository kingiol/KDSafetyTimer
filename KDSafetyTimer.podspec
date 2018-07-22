Pod::Spec.new do |s|
  s.name         = "KDSafetyTimer"
  s.version      = "0.0.1"
  s.summary      = "KDSafetyTimer can elegant solve Timer retain cycle."
  s.homepage     = "https://github.com/kingiol/KDSafetyTimer"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "kingiol" => "kingxiaokang@gmail.com" }

  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/kingiol/KDSafetyTimer.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.swift"
end
