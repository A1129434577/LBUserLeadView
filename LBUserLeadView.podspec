Pod::Spec.new do |spec|
  spec.name         = "LBUserLeadView"
  spec.version      = "1.0.0"
  spec.summary      = "用户操作引导"
  spec.description  = "用户操作引导，支持引导图完全自定义。"
  spec.homepage     = "https://github.com/A1129434577/LBUserLeadView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBUserLeadView.git', :tag => spec.version.to_s }
  spec.source_files = "LBUserLeadView/**/*.{h,m}"
  spec.requires_arc = true
end
