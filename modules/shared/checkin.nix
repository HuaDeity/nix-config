{
  inputs,
  ...
}:

{
  imports = [
    inputs.mihoyo-bbs-tools.homeModules.default
  ];

  services.mihoyo-bbs-tools = {
    enable = true;
    settings.config = {
      enable = true;
      version = 14;
      push = "";
      account = {
        cookie = "_MHYUUID=a310f178-8f8d-4c8e-bcbf-2664b7041eb8; DEVICEFP=85831856184; MIHOYO_LOGIN_PLATFORM_LIFECYCLE_ID=0be1605242; cookie_token_v2=v2_d2BicVXGpM46KKWjHR2AfWTpzJUw5PC0xcelPBLoCVBk6Y8PNhQNTlk6Mya-7Z6cPnfMuHRKCuRjShOYhFw8pUNNRNkQsjVR2GSW2kBrMkm3wK8VUuilM5lBEbaGhXn9XbVRYe_0LM8lUDlCCKM=.CAE=; account_mid_v2=0bjebtctb2_mhy; account_id_v2=306112498; ltoken_v2=v2_ysWEsQEDeixyC46-4pIqe26K-tRhxmgettZtjeW-boS9s26uflebSBGAtdduzdtMVAE6dAIa4oNaTPbuL3jOYDPrWLJX215XAVyc6puJVWrVOGfJxp866l43ZCX6lRLep3KvAHySdMfOD_AQTQ==.CAE=; ltmid_v2=0bjebtctb2_mhy; ltuid_v2=306112498; cookie_token=8aNygVPwksYMQNtLSSFrq0uAwOF33kYAaap6f3KV; account_id=306112498; ltoken=bEbQ8lEWupxXsTgpDKLQmjZbVttZB7gC7FsjavVK; ltuid=306112498";
        stuid = "306112498";
        stoken = "v2_KDULOP3TXJ9K13LXeuxK-oDw1AcSd3B1POVDLjOG08xO6dEcXLn6Z8yYXHcUIBRkgvcmRBVdXwYCr60ETHxalUR0pO_QoAXUJ6_OGSeOeAhpM4NniDYArm6nt5_a4pA7GgdKn1AGETuO2rPkh0s=.CAE=";
        mid = "0bjebtctb2_mhy";
      };
      device = {
        name = "Xiaomi MI 6";
        model = "Mi 6";
        id = "";
      };
      mihoyobbs = {
        enable = true;
        checkin = true;
        checkin_list = [
          2
          6
          8
        ];
        read = true;
        like = true;
        cancel_like = true;
        share = true;
      };
      games = {
        cn = {
          enable = true;
          useragent = "Mozilla/5.0 (Linux; Android 12; Unspecified Device) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/103.0.5060.129 Mobile Safari/537.36";
          retries = 3;
          honkai_sr = {
            checkin = true;
          };
          genshin = {
            checkin = true;
          };
          zzz = {
            checkin = true;
          };
        };
      };
      cloud_games = {
        cn = {
          enable = true;
          genshin = {
            enable = true;
            token = "ai=4;ci=1;oi=306112498;ct=v2_38bf44c16d5dc22a7d1942654034fe9a2e46b1a4;si=185b5ccc65af6697c8a4aa1994ca779a4b5bcac628b2bf13c1847ce0fdf887e8;bi=hk4e_cn";
          };
          honkai_sr = {
            enable = true;
            token = "ai=8;ci=1;oi=306112498;ct=v2_cf0bdae13c2ae89a1916d2cb21c34b2336e9792e;si=d23e8233a874aa53e65d460f8115689e7cec674685071bc56f92cf48d6ce5174;bi=hkrpg_cn";
          };
        };
      };
    };
    onCalendar = "09:11";
  };
}
