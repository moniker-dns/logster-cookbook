
describe 'logster::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'installs logster' do
    assert_file "/usr/bin/logster", "root", "root", "755"
  end
end
