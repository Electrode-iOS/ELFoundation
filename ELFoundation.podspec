#
#  Be sure to run `pod spec lint ELFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ELFoundation"
  s.version      = "0.0.3"
  s.summary      = "Provides a base layer of functionality for Electrode-iOS modules and applications"

  s.description  = <<-DESC
        ELFoundation is a Swift framework that provides a base layer of functionality for Electrode-iOS modules
        and applications such as helper extensions, utility classes, and other generic constructs.
        DESC
  s.homepage     = "https://github.com/Electrode-iOS/ELFoundation"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Walmart"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/Electrode-iOS/ELFoundation.git", :tag => "v0.0.3" }
  s.source_files  = 'ELFoundation/Utilities', 'ELFoundation/Extensions', 'ELFoundation/TestExtensions/*.swift'
end
