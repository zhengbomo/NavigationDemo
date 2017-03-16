Pod::Spec.new do |s|

  s.name         = "BMTabBarController"
  s.version      = "1.0.1"
  s.summary      = "A highly customized tabBarController!"
  s.homepage     = "https://github.com/zhengbomo/NavigationDemo"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "bomo" => "zhengbomo@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/zhengbomo/NavigationDemo.git", :tag => s.version }
  s.source_files = "NavigationDemo/NavigationDemo/BMTabBarController/*.{h,m}"
  s.resource     = 'NavigationDemo/NavigationDemo/BMTabBarController/BMTabBarController.bundle'
  s.requires_arc = true

end
