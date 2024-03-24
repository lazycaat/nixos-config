{
  lib,
  ...
}:

{

  networking.firewall = {
    enable = true;
    allowPing = false;
    allowedTCPPorts = lib.mkForce [];
    allowedTCPPortRanges = lib.mkForce [];
    allowedUDPPorts = lib.mkForce [];
    allowedUDPPortRanges = lib.mkForce [];
    trustedInterfaces = lib.mkForce ["lo"];
    logRefusedConnections = true;
  };

}
