# Give your project a name. :)
workspace(name = "lingo")

# Load the repository rule to download an http archive.
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    sha256 = "f018cec368a8d77de1f67f5f927cfb7b95546cd5bfe00229d09292637b734b4d",
    strip_prefix = "rules_haskell-caebd156327e87773b6ef755cb4bcafd3dd16da1",
    urls = ["https://github.com/tweag/rules_haskell/archive/caebd156327e87773b6ef755cb4bcafd3dd16da1.tar.gz"],
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

load(
    "@rules_haskell//haskell:toolchain.bzl",
    "rules_haskell_toolchains",
)

# Download a GHC binary distribution from haskell.org and register it as a toolchain.
rules_haskell_toolchains(version = "8.10.1")

load(
    "@rules_haskell//haskell:cabal.bzl",
    "stack_snapshot",
)

stack_snapshot(
    name = "stackage",
    local_snapshot = "//:stack-snapshot.yaml",
    packages = [
        "aeson",
        "attoparsec",
        "base64-bytestring",
        "proto-lens-runtime",
        "vector",
    ],
)
