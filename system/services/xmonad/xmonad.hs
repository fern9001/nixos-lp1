import XMonad
import XMonad.Util.EZConfig

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Loggers

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

import Graphics.X11.ExtraTypes.XF86
import System.IO

main = do
  xmproc <- spawnPipe "xmobar /etc/nixos/system/services/xmonad/.xmobarrc"
  xmonad $ docks def
    { terminal = "termite"
    , manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts $ layoutHook def
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor green "" . shorten 100
      , ppCurrent = xmobarColor mono4 blue . wrap " " " "
      , ppSep = " "
      }
    , modMask = mod4Mask
    , borderWidth = 1
    , normalBorderColor  = pmenu
    , focusedBorderColor = blue }
    `additionalKeys`
    [ ((mod4Mask, xK_p              ), spawn "dmenu_run -fn 'monospace:regular:pixelsize=10' -nb '#282c34' -sf '#282c34' -sb '#98c379' -nf '#abb2bf'" )
    , ((0, xF86XK_AudioMute         ), spawn "amixer set Master toggle")
    , ((0, xF86XK_AudioLowerVolume  ), spawn "amixer -q set Master 2%-")
    , ((0, xF86XK_AudioRaiseVolume  ), spawn "amixer -q set Master 2%+")
    , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -dec 5")
    , ((0, xF86XK_MonBrightnessUp   ), spawn "xbacklight -inc 5") ]



mono1 = "#abb2bf"
mono2 = "#828997"
mono3 = "#5c6370"
mono4 = "#4b5263"
cyan    = "#56b6c2"
blue    = "#61afef"
purple  = "#c678dd"
green   = "#98c379"
red1    = "#e06c75"
red2    = "#be5046"
orange1 = "#d19a66"
orange2 = "#e5c07b"

syntax_bg     = "#282c34"
syntax_gutter = "#636d83"
syntax_cursor = "#2c323c"
syntax_accent = "#528bff"

vertsplit    = "#181a1f"
special_grey = "#3b4048"
visual_grey  = "#3e4452"
pmenu        = "#333841"
