# frozen_string_literal: true

namespace :populate do
  desc 'Pull production db to development'
  # NOTE: Copie la DB de prod en local
  task dev_db: %i[create_local_db]

  # Following task are like private methods. Don't call them
  task create_local_db: :environment do
    Rails.logger.info 'Drop local database'
    system 'rails db:drop'
    Rails.logger.info 'Copy production database to new local database'
    system 'heroku pg:pull -r heroku DATABASE_URL accounting_software_development'
    Rails.logger.info 'Run migrations'
    system 'rails db:migrate'
    system 'rails db:test:prepare'
  end
end
