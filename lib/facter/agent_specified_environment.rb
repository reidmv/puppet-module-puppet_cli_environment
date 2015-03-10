Facter.add(:agent_specified_environment) do
  setcode do
    # This will be nil if Puppet is not available.
    begin
      Module.const_get("Puppet")
    rescue NameError
      nil
    else
      Puppet[:environment]
    end
  end
end
