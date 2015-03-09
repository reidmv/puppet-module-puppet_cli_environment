Facter.add(:puppet_cli_environment) do
  setcode do
    # This will be nil if Puppet is not available.
    begin
      Module.const_get("Puppet")
    rescue NameError
      nil
    else
      Puppet[:environment] if Puppet.settings.setting(:environment).setbycli
    end
  end
end
