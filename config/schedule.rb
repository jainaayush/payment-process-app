# Use this file to easily define all of your cron jobs.
#

every 1.hour do
  rake "delete:transactions"
end
