require 'spec_helper'
describe 'docker_ee' do
  context 'with default values for all parameters' do
    let(:params) { { 'docker_ee_url' => 'http://autostructure.io/docker.repo' } }

    it { should contain_class('docker_ee') }
    it { should contain_class('docker_ee::pre_install').that_notifies('Class[docker_ee::yum_memcache]') }
    it { should contain_class('docker_ee::yum_memcache').that_comes_before('Class[docker_ee::install]') }
    it { should contain_class('docker_ee::install') }

    it { is_expected.to contain_package('device-mapper-persistent-data') }
    it { is_expected.to contain_package('lvm2') }
    it { is_expected.to contain_package('yum-utils') }
    it { is_expected.to contain_package('docker-ee') }

    it { is_expected.to contain_file('/etc/yum/vars/dockerosversion') }
    it { is_expected.to contain_file('/etc/yum/vars/dockerurl') }

    it { is_expected.to compile.with_all_deps }
  end
end
