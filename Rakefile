task :default do
  %w(producer producer_client consumer).each do |directory|
    Dir.chdir(directory) do
      system 'bin/rake' or fail "#{directory} tests failed!"
    end
  end
end
