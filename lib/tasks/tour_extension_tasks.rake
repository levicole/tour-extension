namespace :radiant do
  namespace :extensions do
    namespace :tour do
      
      desc "Runs the migration of the Tour extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          TourExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          TourExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Tour to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from TourExtension"
        Dir[TourExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(TourExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
