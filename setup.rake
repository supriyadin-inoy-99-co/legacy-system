amespace :deploy do

	desc "Setup configuration after deploy:symlink"
	task :setup_config do
		on roles(:app) do
			app = fetch(:application)
			within release_path do

				# new staging & new beta
				if app == 'r123-staging-new-api' or app == 'r123-beta-new-api' or app == 'r123-new-api' or app == 'r123-stg-new-api'

					execute :ln, '-sf', "#{shared_path}/settings/config.php", "#{release_path}/apps/config/"
					execute :ln, '-sf', "#{shared_path}/settings/database.php", "#{release_path}/apps/config/"
					execute :ln, '-sf', "#{shared_path}/settings/external.php", "#{release_path}/apps/config/"
					execute :ln, '-sf', "#{shared_path}/settings/modules.php", "#{release_path}/apps/config/"
					execute :ln, '-sf', "#{shared_path}/settings/oauth.php", "#{release_path}/apps/config/"
					execute :ln, '-sf', "#{shared_path}/settings/vendor", "#{release_path}/"
					execute :ln, '-sf', "#{shared_path}/public/.htaccess", "#{release_path}/public/"
					execute :ln, '-sf', "#{shared_path}/public/docs.php", "#{release_path}/public/"
					execute :ln, '-sf', "#{shared_path}/public/csv", "#{release_path}/public/files/"
					#consumer config
					# execute :ln, '-sf', "#{shared_path}/settings/consumer/config/config.php", "#{release_path}/consumer/apps/config/"
					# execute :ln, '-sf', "#{shared_path}/settings/consumer/config/database.php", "#{release_path}/consumer/apps/config/"
					# execute :ln, '-sf', "#{shared_path}/settings/consumer/vendor", "#{release_path}/consumer/"

				# staging
				elsif app == 'r123-staging-api'
					execute :ln, '-sf', "#{shared_path}/settings/config", "#{release_path}/apps/v1/"
					execute :ln, '-sf', "/home/deploy/staging-new-api/current", "#{release_path}/new"

				# beta
				elsif app == 'r123-beta-api'
					execute :ln, '-sf', "#{shared_path}/settings/config", "#{release_path}/apps/v1/"
					execute :ln, '-sf', "/var/www/html/new_api_beta_releases/current", "#{release_path}/new"

				# production
				elsif app == 'r123-api'
					execute :ln, '-sf', "#{shared_path}/settings/config", "#{release_path}/apps/v1/"

				else
					puts "No application name found!"
					
				end



			end
		end

	end

end
after 'deploy:updated', 'deploy:setup_config'
