require 'spec_helper'


describe 'foreman_certs::config' do
  let :default_facts do
    {
      :concat_basedir => '/tmp',
      :interfaces     => '',
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

      it "should setup PKI directory" do
        should contain_file('/etc/pki/foreman').with({
          'ensure' => 'directory',
          'owner'  => 'foreman',
          'group'  => 'foreman',
          'mode'   => '0755',
        })
      end

      it "should setup certs directory" do
        should contain_file('/etc/pki/foreman/certs').with({
          'ensure' => 'directory',
          'owner'  => 'foreman',
          'group'  => 'foreman',
          'mode'   => '0755',
        })
      end

      it "should setup private directory" do
        should contain_file('/etc/pki/foreman/private').with({
          'ensure' => 'directory',
          'owner'  => 'foreman',
          'group'  => 'foreman',
          'mode'   => '0755',
        })
      end

      it 'should set up the config' do
        should contain_file('/etc/pki/foreman/openssl.cnf').
          with_content(/^dir = \/etc\/pki\/foreman$/).
          with({})
      end

    end
  end
end
