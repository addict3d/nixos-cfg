self: super:
{
  weechat = super.weechat.override {
    configure = { availablePlugins, ... }: {
      scripts = with super.weechatScripts; [
        #weechat-otr
        weechat-matrix
        wee-slack
        multiline
      ];
    };
  };
}
