require 'spec_helper'

describe 'backup', :type => :class do
  let(:facts) { { :osfamily => 'RedHat' } }

  describe 'Redhat' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'install dependencies' do
      it { should contain_package('libxml2-devel') }
    end

    context 'without dependencies' do
      let(:params) { { :install_dependencies => false } }

      it { should_not contain_package('libxml2-devel') }
    end
  end

  describe 'Debian' do
    let(:facts) { { :osfamily => 'Debian' } }

    context 'install dependencies' do
      it { should contain_package('libxml2-dev') }
    end

    context 'without dependencies' do
      let(:params) { { :install_dependencies => false } }

      it { should_not contain_package('libxml2-dev') }
    end
  end

  describe 'backup package' do
    let(:facts) { { :osfamily => 'RedHat' } }

    context 'default (latest)' do
      it { should contain_package('rubygem-backup').with(:ensure => 'latest', :provider => 'gem' ) }
    end

    context 'set ensure' do
      let(:params) { { :ensure => '1.2.3' } }
      it { should contain_package('rubygem-backup').with(:ensure => '1.2.3', :provider => 'gem' ) }
    end

    context 'set provider' do
      let(:params) { { :package_provider => 'rpm', :package_name => 'rubygem-backup' } }
      it { should contain_package('rubygem-backup').with(:provider => 'rpm', :name => 'rubygem-backup' ) }
    end
  end

end