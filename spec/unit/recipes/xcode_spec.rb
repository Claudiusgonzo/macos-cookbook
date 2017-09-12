require 'spec_helper'

describe 'macos::xcode' do
  context 'Xcode recipe converges successfully' do
    before do
      stub_data_bag_item('credentials', 'apple_id').and_return(['apple_id'])
      stub_data_bag_item('credentials', 'apple_id').and_return(['password'])
    end

    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.12')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
