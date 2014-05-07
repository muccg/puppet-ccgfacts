#Maps dmidecode information to factvars
if FileTest.exists?("/sbin/ip")

  # Run ip route and set the result in gateway
  Facter.add("gateway") do
    setcode do
      %x{/sbin/ip route | awk '/default/ { print $3 }'}.chomp
    end
  end
end
