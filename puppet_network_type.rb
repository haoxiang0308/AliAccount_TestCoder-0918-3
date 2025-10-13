# frozen_string_literal: true

Puppet::Type.newtype(:network_config) do
  desc 'A custom Puppet type for managing basic network configuration.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the network interface.'
    isnamevar
  end

  newproperty(:ipaddress) do
    desc 'The IP address for the interface.'
    validate do |value|
      # Basic validation for an IP address string
      unless value =~ Resolv::AddressRegex
        raise ArgumentError, "Invalid IP address: #{value}"
      end
    end
  end

  newproperty(:netmask) do
    desc 'The netmask for the interface.'
    validate do |value|
      # Basic validation for a netmask string
      unless value =~ Resolv::AddressRegex
        raise ArgumentError, "Invalid netmask: #{value}"
      end
    end
  end

  newproperty(:gateway) do
    desc 'The default gateway for the interface.'
    validate do |value|
      # Basic validation for an IP address string
      unless value =~ Resolv::AddressRegex
        raise ArgumentError, "Invalid gateway: #{value}"
      end
    end
  end
end
