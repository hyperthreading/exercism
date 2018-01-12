module Paths_isbn_verifier (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [2,0,0,2] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/carl/.cabal/bin"
libdir     = "/home/carl/.cabal/lib/x86_64-linux-ghc-7.10.3/isbn-verifier-2.0.0.2-2LxZ68eJsr41Bf5mYOokU4"
datadir    = "/home/carl/.cabal/share/x86_64-linux-ghc-7.10.3/isbn-verifier-2.0.0.2"
libexecdir = "/home/carl/.cabal/libexec"
sysconfdir = "/home/carl/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "isbn_verifier_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "isbn_verifier_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "isbn_verifier_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "isbn_verifier_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "isbn_verifier_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
