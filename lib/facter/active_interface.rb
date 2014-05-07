if FileTest.exists?("/sbin/ip")

  # Run ip route and set the result in gateway
  Facter.add("active_interface") do
    setcode do
      %x{/sbin/ip route | awk '/default/ { print $5 }'}.chomp
    end
  end
end
