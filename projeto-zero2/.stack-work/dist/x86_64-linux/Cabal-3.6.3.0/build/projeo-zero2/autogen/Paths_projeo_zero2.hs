{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_projeo_zero2 (
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
bindir     = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/bin"
libdir     = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/lib/x86_64-linux-ghc-9.2.7/projeo-zero2-0.1.0.0-JWT4iQsI7YBJcCSSNMc8UK-projeo-zero2"
dynlibdir  = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/share/x86_64-linux-ghc-9.2.7/projeo-zero2-0.1.0.0"
libexecdir = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/libexec/x86_64-linux-ghc-9.2.7/projeo-zero2-0.1.0.0"
sysconfdir = "/home/jeanpierre/Documentos/Haskell/projeto-zero2/.stack-work/install/x86_64-linux/373d2a2125281ef752faeaa0acfec068c4ea1ccf1de776fa17efbb92b09d368a/9.2.7/etc"

getBinDir     = catchIO (getEnv "projeo_zero2_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "projeo_zero2_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "projeo_zero2_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "projeo_zero2_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projeo_zero2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projeo_zero2_sysconfdir") (\_ -> return sysconfdir)




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
