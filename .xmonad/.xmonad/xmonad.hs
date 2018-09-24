import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.SimplestFloat
import XMonad.Hooks.FloatNext
import XMonad.Layout.Spiral
import XMonad.Layout.PerWorkspace(onWorkspace)
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal = "/usr/bin/gnome-terminal"

myWorkspaces = ["bash","web","mail","ide","alt","chat","media","spotify","system"]

myManageHook = floatNextHook <+> composeAll
   [ manageDocks
   , className =? "Download"	    --> doIgnore
   , className =? "Vivaldi"         --> doShift "web"
   , className =? "Thunderbird"     --> doShift "mail"
   , className =? "Eclipse"         --> doShift "ide"
   , className =? "Rocket.Chat+"    --> doShift "chat"
   , className =? "vlc"             --> doShift "media"
   , className =? "Spotify"         --> doShift "spotify"
   , role =? "browser"              --> doShift "web"
   ]
   where role = stringProperty "WM_WINDOW_ROLE"

defaultLayouts = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    spiral (6/7)) |||
    noBorders (fullscreenFull Full)

myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

xmobarTitleColor = "green"

xmobarCurrentWorkspaceColor = "#CEFFAC"

myBorderWidth = 3

myModMask = mod4Mask

myLayouts = onWorkspace "" simplestFloat $ defaultLayouts

myStartupHook = return ()

main = do  
 xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
 xmonad $ defaults  
      { manageHook = myManageHook <+> manageHook defaultConfig
      , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook  
      , layoutHook = avoidStruts $ myLayouts
      , logHook = dynamicLogWithPP xmobarPP  
           { ppOutput = hPutStrLn xmproc  
           , ppTitle = xmobarColor "#657b83" "" . shorten 100   
           , ppCurrent = xmobarColor "#c0c0c0" "" . wrap "" ""
           , ppSep     = xmobarColor "#c0c0c0" "" " | "
           , ppUrgent  = xmobarColor "#ff69b4" ""
           , ppLayout = const "" -- to disable the layout info on xmobar  
           } 
     } `additionalKeys`
     [ ((0, 0xff98), spawn "/home/harzival/.xmonad/workspaceinit.sh")
     ] 

defaults = defaultConfig {
    terminal = myTerminal,
    borderWidth = myBorderWidth,
    modMask = myModMask,
    workspaces = myWorkspaces,
    normalBorderColor = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    startupHook = myStartupHook
}
