Facter.add(:puppet_environment_setbycli) do
  setcode do
    # This will be nil if Puppet is not available.
    begin
      Module.const_get("Puppet")
    rescue NameError
      nil
    else
      Puppet.settings.setting(:environment).setbycli
    end
  end
end
