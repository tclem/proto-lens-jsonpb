module Main where

import           Data.Aeson (ToJSON (..), fromEncoding)
import           Data.ByteString.Builder (toLazyByteString)
import qualified Data.ByteString.Lazy.Char8 as BC
import           Data.ProtoLens (defMessage)
import           Lens.Micro
import           Proto.Haberdasher as P
import           Proto.Haberdasher_Fields as P
import           Proto.Haberdasher_JSON ()

main :: IO ()
main = do
  print mkPong
  BC.putStrLn $ toLazyByteString (fromEncoding (toEncoding mkPong))
  where
    mkPong :: Pong
    mkPong = defMessage
      & P.status .~ "OK"
      & P.stuff .~ mempty
      & P.maybe'extra .~ Nothing
      & P.id .~ 1
      & P.type' .~ "hello"
