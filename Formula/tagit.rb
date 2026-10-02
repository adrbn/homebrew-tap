class Tagit < Formula
  include Language::Python::Virtualenv

  desc "Find a song's real metadata, show the changes and write them on a yes"
  homepage "https://github.com/adrbn/tagit"
  url "https://github.com/adrbn/tagit/archive/refs/tags/v1.0.0.tar.gz"
  # Placeholder: fill in once the v1.0.0 tag exists on GitHub, with
  #   curl -sL https://github.com/adrbn/tagit/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
  sha256 "a4fd8fda89a9b541c2b1484cd456986200da585249d69f166ac66a487635b3fc"
  license "MIT"

  depends_on "python@3.13"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/df/70/1675da133ea92227da41bf5b24e1c66be597ff736a1533ade41da986852f/mutagen-1.48.1.tar.gz"
    sha256 "8f95637ab9f6f305cec6bd1294e197debe207998e3e068596563c74f86b0a173"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      ReplayGain needs ffmpeg:  brew install ffmpeg
      The optional send step is configured in ~/.config/tagit/config.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tagit --version")
  end
end
