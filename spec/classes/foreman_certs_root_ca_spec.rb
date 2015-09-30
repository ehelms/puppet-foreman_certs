require 'spec_helper'


describe 'foreman_certs::root_ca' do
  let :default_facts do
    {
      :concat_basedir => '/tmp',
      :interfaces     => '',
      :fqdn           => 'localhost.localdomain',
    }
  end

  context 'on redhat' do
    let :facts do
      default_facts.merge({
        :operatingsystem        => 'RedHat',
        :operatingsystemrelease => '6.4',
        :osfamily               => 'RedHat',
      })
    end

    describe 'without parameters' do
      let :pre_condition do
        "class {'foreman_certs':}"
      end

      it 'should contain openssl::certificate::authority' do
        should contain_openssl__certificate__authority('ca').
          with_pki_dir('/etc/pki/foreman').
          with_common_name('localhost.localdomain')
      end
    end
  end
end
