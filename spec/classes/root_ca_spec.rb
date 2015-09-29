#require 'spec_helper'
#
#
#describe 'foreman_certs::root_ca' do
#  let :default_facts do
#    {
#      :concat_basedir => '/tmp',
#      :interfaces     => '',
#    }
#  end
#
#  let :facts do
#    default_facts.merge({
#      :operatingsystem        => 'RedHat',
#      :operatingsystemrelease => '6.4',
#      :osfamily               => 'RedHat',
#    })
#  end
#
#  it 'should set up the config' do
#    should contain_file('/etc/foreman/database.yml').with({
#      'owner'   => 'root',
#      'group'   => 'foreman',
#      'mode'    => '0640',
#      'content' => /adapter: postgresql/,
#    })
#  end
#
#end
