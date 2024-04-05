{
  pkgs,
  ...
}:

{

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      listen_addresses = ["127.0.0.1:53" "[::1]:53"];
      max_clients = 256;
      ipv4_servers = true;
      ipv6_servers = true;
      block_ipv6 = false;

      require_dnssec = true;
      require_nofilter = true;
      require_nolog = true;

      cache = true;
      cache_size = 8192;

      force_tcp = true;
      timeout = 5000;
      keepalive = 60; # DoT/DoH/ODoH
      dnscrypt_ephemeral_keys = true;
      tls_disable_session_tickets = true;
      bootstrap_resolvers = [
        "8.8.8.8:53"
        "9.9.9.9:53"
        "1.1.1.1:53"
      ];
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          "https://download.dnscrypt.info/dnscrypt-resolvers/v3/opennic.md"
          #"https://download.dnscrypt.info/dnscrypt-resolvers/v3/onion-services.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
      server_names = [
        "doh-ibksturm"
        "publicarray-au2-doh"
        "adguard-dns-doh"
        "ahadns-doh-nl"
        "ahadns-doh-la"
        "ams-ads-doh-nl"
        "adguard-dns-doh"
      ];
      disabled_server_names = ["yandex"];
    };
  };

  networking = {
    nameservers = [ "127.0.0.1" ];
    networkmanager.dns = "none";
  };

  environment.systemPackages = [ pkgs.dig ];

}
