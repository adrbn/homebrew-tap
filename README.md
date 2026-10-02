# adrbn/homebrew-tap

Homebrew formulae for [adrbn](https://github.com/adrbn)'s command-line tools.

```sh
brew install adrbn/tap/tagit
```

or

```sh
brew tap adrbn/tap
brew install tagit
```

| Formula | What it is |
|---|---|
| [tagit](https://github.com/adrbn/tagit) | Finds a song's real metadata on Deezer, Apple, MusicBrainz and LRCLIB, shows the changes and writes them on a yes |

## Updating a formula for a new release

1. Tag the release in the tool's repo (`git tag vX.Y.Z && git push origin vX.Y.Z`).
2. In `Formula/<name>.rb`, set `url` to the new tag's tarball and `sha256` to the output of:

   ```sh
   curl -sL https://github.com/adrbn/<name>/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```

3. Check it: `brew install --build-from-source adrbn/tap/<name> && brew test <name> && brew audit --strict adrbn/tap/<name>`.

## License

MIT, like the tools themselves.
