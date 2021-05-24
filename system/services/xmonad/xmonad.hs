import XMonad
import XMonad.Util.EZConfig

import XMonad.Actions.GridSelect

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Loggers

import XMonad.Hooks.ManageDocks (avoidStruts, docks, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.DynamicLog

import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

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
      , ppTitle = xmobarColor mono1 "" . shorten 100 . wrap " " " "
      , ppCurrent = xmobarColor vertsplit green . wrap (xmobarColor mono4 green "\xe0b0 " ) (" " ++ xmobarColor green mono4 "\xe0b0" )
      , ppSep = xmobarColor mono3 mono4 " \xe0b1 "
      }
    , modMask = mod4Mask
    , borderWidth = 1
    , normalBorderColor  = pmenu
    , focusedBorderColor = mono4 }
    `additionalKeys`
    [ ((mod4Mask, xK_p              ), spawn ("dmenu_run -b -fn '"++ myFont ++":regular:pixelsize=12' -nb '"++ mono4 ++"' -sf '"++ special_grey ++"' -sb '#98c379' -nf '#abb2bf'") )
    , ((0, xF86XK_AudioMute         ), spawn "amixer set Master toggle")
    , ((0, xF86XK_AudioLowerVolume  ), spawn "amixer -q set Master 2%-")
    , ((0, xF86XK_AudioRaiseVolume  ), spawn "amixer -q set Master 2%+")
    , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -dec 5")
    , ((0, xF86XK_MonBrightnessUp   ), spawn "xbacklight -inc 5")
    , ((mod4Mask, xK_i              ), sendMessage ToggleStruts)
    , ((mod4Mask, xK_g              ), spawnSelected' myAppGrid)                 -- grid select favorite apps
    , ((mod4Mask, xK_t              ), goToSelected $ mygridConfig myColorizer)  -- goto selected window
    , ((mod4Mask, xK_b              ), bringSelected $ mygridConfig myColorizer) -- bring selected window
    ]

myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
                  (0x28,0x2c,0x34) -- lowest inactive bg
                  (0x28,0x2c,0x34) -- highest inactive bg
                  (0xc7,0x92,0xea) -- active bg
                  (0xc0,0xa7,0x9a) -- inactive fg
                  (0x28,0x2c,0x34) -- active fg

-- gridSelect menu layout
mygridConfig :: p -> GSConfig Window
mygridConfig colorizer = (buildDefaultGSConfig myColorizer)
    { gs_cellheight   = 40
    , gs_cellwidth    = 200
    , gs_cellpadding  = 6
    , gs_originFractX = 0.5
    , gs_originFractY = 0.5
    , gs_font         = myFont
    }

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
    where conf = def
                   { gs_cellheight   = 40
                   , gs_cellwidth    = 200
                   , gs_cellpadding  = 6
                   , gs_originFractX = 0.5
                   , gs_originFractY = 0.5
                   , gs_font         = myFont
                   }

myAppGrid =
  [ ("Firefox", "firefox")
  , ("Termite", "termite")
  , ("test", "termtie") ]

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

myFont = "Monoid"
