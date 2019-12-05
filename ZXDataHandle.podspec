Pod::Spec.new do |s|
s.name         = 'ZXDataHandle'
s.version      = '1.0.7'
s.summary      = '轻量级数据转换和存储框架'
s.homepage     = 'https://github.com/SmileZXLee/ZXDataHandle'
s.license      = 'MIT'
s.authors      = {'李兆祥' => '393727164@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/SmileZXLee/ZXDataHandle.git', :tag => s.version}
s.source_files = 'ZXDataHandle/**/*'
s.requires_arc = true
end