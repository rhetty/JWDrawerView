Pod::Spec.new do |s|
  s.name         = "JWDrawerView"
  s.version      = "1.1.1"
  s.summary      = "A slidable view like a drawer."
  s.homepage     = "https://github.com/rhetty/JWDrawerView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jiawei Huang" => "tcrhetty@gmail.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/rhetty/JWDrawerView.git", :tag => s.version}
  s.source_files  = 'JWDrawerView/DrawerView/*.{h,m}'
  s.requires_arc = true
end
