Pod::Spec.new do |s|
  s.name             = "Popover"    #名称
  s.version          = "0.1.0"             #版本号
  s.summary          = "A library to create PopupWindow View."
  s.description      = "A library to create PopupWindow View.It run on iOS."
  s.homepage         = "https://github.com/iDalink/PopoverView"  
  s.license          = { :type => 'zlib', :file => 'LICENSE' } 
  s.author           = { "Dalink" => "n400800@gmail.com" }
  s.source           = { :git => "https://github.com/iDalink/PopoverView.git", :tag => "0.1.0" }
  s.platform         = :ios            #支持的平台及版本
  s.requires_arc     = true                   #是否使用ARC，如果指定具体文件，则具体的问题使用ARC
 
  s.source_files     = 'Classes'
  s.frameworks       = 'UIKit'                  #所需的framework，多个用逗号隔开
end
