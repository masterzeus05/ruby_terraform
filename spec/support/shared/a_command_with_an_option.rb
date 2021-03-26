shared_examples 'a command with an option' do |command, option, directory = nil, switch_override: nil|
  switch = switch_override.nil? ? "-#{option.to_s.sub('_', '-')}" : switch_override
  argument = directory.nil? ? nil : " #{directory}"

  it_behaves_like 'a valid command line', {
    reason: "adds a #{switch} option if a #{option} is provided",
    expected_command: "terraform #{command} #{switch}=true#{argument}",
    options: { directory: directory,
               option => 'true' }
  }
end