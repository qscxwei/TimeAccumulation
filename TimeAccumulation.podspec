Pod::Spec.new do |s|
  s.name         = "TimeAccumulation"
  s.version      = "0.0.3"
  s.summary      = "时间积累：记录所有使用过的公共方法"
  s.homepage     = "https://github.com/qscxwei/TimeAccumulation"
  s.license      = "MIT"
  s.author    = "qscxwei"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/qscxwei/TimeAccumulation.git", :tag => "0.0.3" }
  s.source_files  = "TimeAccumulation/TimeAccumulation.h","TimeAccumulation/Accumulation/*.{m,h}"
  s.requires_arc = true

end
