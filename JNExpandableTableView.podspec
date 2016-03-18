Pod::Spec.new do |s|
  s.name     = 'JNExpandableTableView'
  s.version  = '1.0.3'
  s.platform = :ios, '7.0'
  s.license  = { :type => 'MIT'}
  s.summary  = 'Expandable UITableView'
  s.homepage = 'https://github.com/jonasman/JNExpandableTableView'
  s.author   = { 'Joao Nunes' => 'joao3001@hotmail.com' }

  s.source   = { :git => 'https://github.com/jonasman/JNExpandableTableView.git',
		:tag => "#{s.version}" }

  s.description  = 'A UITableView subclass that allow cells to expand.'
  s.source_files = 'JNExpandableTableView/*.{h,m}'
  s.requires_arc = true
end
