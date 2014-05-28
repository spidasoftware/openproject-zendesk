#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.md for more details.
#++

# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'open_project/plugins'
# require 'open_project/notifications'

module OpenProject::Zendesk
  class Engine < ::Rails::Engine
    engine_name :openproject_zendesk

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-zendesk',
             :author_url => 'http://www.spidasoftware.com',
             :requires_openproject => '>= 3.1.0pre1'


    initializer 'github.register_hook' do
      ::OpenProject::Webhooks.register_hook 'zendesk' do |hook, environment, params, user|
        HookHandler.new.process(hook, environment, params, user)
      end
    end

    initializer 'zendesk.subscribe_to_notifications' do
      ::OpenProject::Notifications.subscribe('github.pull_request',
                                             &NotificationHandlers.method(:pull_request))
      ::OpenProject::Notifications.subscribe('github.issue_comment',
                                             &NotificationHandlers.method(:issue_comment))
    end

  end
end
