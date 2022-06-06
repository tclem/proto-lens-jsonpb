# proto-lens-jsonpb

Quick hack to generate orphan ToJSON/FromJSON instances for proto-lens.

This requires the use of [proto-lens](https://github.com/google/proto-lens) to generate haskell datatypes from proto messages.

## Requirements

1. Install `protoc` (e.g., `brew install protoc`)
2. Install the required protoc plugins:
   - `cabal install proto-lens-protoc`
   - `go install github.com/tclem/proto-lens-jsonpb/protoc-gen-jsonpb_haskell`

## Usage

Use the protoc plugin to generate associated protobuf types from a proto file.

```
protoc -I=. --proto_path=./proto \
  --plugin=protoc-gen-haskell=`which proto-lens-protoc` --haskell_out=./app \
  --plugin=protoc-gen-jsonpb_haskell=./script/run-jsonpb_haskell --jsonpb_haskell_out=./app \
  haberdasher.proto
```
