self: super:
{
  it87 = super.it87.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "frankcrawford";
      repo = "it87";
      # Jan 4th, 2023, Updated to match naming convention used in-tree version
      rev = "3e5333ad0b85216a81f33692875f33456e8064c9";
      sha256 = "sha256-wVhs//iwZUUGRTk1DpV/SnA7NZ7cFyYbsUbtazlxb6Q=";
    };
  });
}
