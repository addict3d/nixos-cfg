{ config, pkgs, ... }:

{
  services.grafana = {
    enable = true;
    settings.server = {
      http_port = 3000;
      http_addr = "127.0.0.1";
    };
  };

  services.prometheus = {
    enable = true;
    port = 9001;

    scrapeConfigs = [
      {
        job_name = "CoPilot-3202104831";
        static_configs = [{targets = [ "172.42.27.164:9100" ]; }];
      }
    ];
  };
}


