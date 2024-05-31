{ config, pkgs, ... } :
{
    environment.etc."nextcloud-admin-pass".text = "PWD";
    services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud29;
        hostName = "localhost";
        config.adminpassFile = "/etc/nextcloud-admin-pass";
        extraApps = {
            inherit (config.services.nextcloud.package.packages.apps) calendar notes cookbook;
        };
        extraAppsEnable = true;
    };
}
