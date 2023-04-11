{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_projeto_tipo31 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/bin"
libdir     = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/lib/x86_64-linux-ghc-9.2.7/projeto-tipo31-0.1.0.0-KFFEOzXdlypCrlUqUOQBD4-projeto-tipo31"
dynlibdir  = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/share/x86_64-linux-ghc-9.2.7/projeto-tipo31-0.1.0.0"
libexecdir = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/libexec/x86_64-linux-ghc-9.2.7/projeto-tipo31-0.1.0.0"
sysconfdir = "/home/jeanpierre/Documentos/Haskell/projeto-tipo31/.stack-work/install/x86_64-linux/be32de3b2a69c48480532973db88fbb685eceac21f2a1462479b6273f72a8e48/9.2.7/etc"

getBinDir     = catchIO (getEnv "projeto_tipo31_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "projeto_tipo31_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "projeto_tipo31_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "projeto_tipo31_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projeto_tipo31_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projeto_tipo31_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
