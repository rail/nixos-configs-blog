{ config,  ... }:

{
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "rail.merail.ca" = {
        forceSSL = true;
        enableACME = true;
        root = "/home/www/rail.merail.ca/";
      };
      "img.lgtm.ca" = {
        forceSSL = true;
        enableACME = true;
        root = "/home/www/img.lgtm.ca";
        serverAliases = [ "img.merail.ca" ];
        locations = {
          "/" = {
            extraConfig = ''
              autoindex on; 
            '';
	  };
        };
      };
      "merail.ca" = {
        forceSSL = true;
        enableACME = true;
        globalRedirect = "rail.merail.ca";
      };
      "lgtm.ca" = {
        forceSSL = true;
        enableACME = true;
        globalRedirect = "rail.merail.ca";
      };
    };
  };
}
