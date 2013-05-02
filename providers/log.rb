# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Author: Kiall Mac Innes <kiall@hp.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
def whyrun_supported?
  false
end

action :add do
  new_resource.updated_by_last_action(false)

  clean_name = new_resource.log_file.gsub(/\//, '_')

  cron "logster-#{clean_name}" do
    command "/usr/bin/logster --output graphite --graphite-host #{new_resource.graphite_host} #{new_resource.parser} #{new_resource.log_file}"
    action :create
  end
end

action :remove do
  clean_name = new_resource.log_file.gsub(/\//, '_')

  cron "logster-#{clean_name}" do
    action :delete
  end
end
