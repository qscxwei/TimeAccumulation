Pod::Spec.new do |s|
  s.name         = "TimeAccumulation"
  s.version      = "0.0.2"
  s.summary      = "生成年月周日等折线图和柱状图"
  s.homepage     = "https://github.com/qscxwei/TimeAccumulation"
  s.license      = "MIT"
  s.author    = "qscxwei"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/qscxwei/TimeAccumulation.git", :tag => "0.0.2" }
  s.source_files  = "TimeAccumulation", "TimeAccumulation/TimeAccumulation/**/*.{h,m}"
  s.exclude_files = "TimeAccumulation/Exclude"
  s.public_header_files = "TimeAccumulation/Accumulation/TimeAccumulation.h","TimeAccumulation/Accumulation/*.h"
  s.requires_arc = true

end
