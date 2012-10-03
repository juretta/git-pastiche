module Main where

import System.Directory
import Control.Monad
import Data.List

extractCommandName :: String -> String
extractCommandName input = dropWhile (not . isPrefixOf ".SH NAME") (lines input) !! 1

-- | Extract the command name and short description from
-- the man pages
extractCommandOverview :: FilePath -> IO [String]
extractCommandOverview path = do
    entries <- getDirectoryContents path
    let files = map (\e -> path ++ "/" ++ e) $ filter (isPrefixOf "git-") entries
    mapM (fmap extractCommandName . readFile) files

replaceCommandsIn :: FilePath -> [String] -> IO String
replaceCommandsIn path content = do
    existing <- readFile path
    let new         = break (== separator) $ lines existing
        clean       = unwords . filter (/= "\\-") . words
        format e    = "* `" ++ unwords (take 2 $ words e) ++ "` -> " ++ unwords (drop 2 $ words e)
    return $ unlines $ fst new ++ [separator, "=========", ""] ++ map (format . clean) content

separator = "Commands"

main = do
    let readme  = "README.md"
        tmp     = "README2.md"
    commandList <- extractCommandOverview "man"
    new <- replaceCommandsIn readme commandList
    writeFile tmp new
    renameFile tmp readme
