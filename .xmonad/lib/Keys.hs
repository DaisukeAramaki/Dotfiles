module Keys where
  import XMonad
  import XMonad.Actions.CycleWS

  -- additional key mappings
  myKeys        =
    [ ((0, xK_Print), spawn "scrot -q 100")                             -- capture screen
    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s -q 100")     -- choose window to capture
    , ((mod4Mask, xK_a), spawn "usualapps")                             -- launch mutt, firefox, and pidgin
    , ((mod4Mask, xK_f), spawn "/usr/local/bin/opera")                  -- Opera
    , ((mod4Mask, xK_p), spawn "exe=`dmenu_path | dmenu -nb '#222222' -nf '#ffa75d' -sb 'gold' -sf 'grey30' -fn -*-nu-*-*-*-*-*-*-*-*-*-*-*-*` && eval \"exec $exe\"") -- dmenu
    , ((mod4Mask, xK_r), spawn "xmonad --recompile && xmonad --restart") -- refresh xmonad config
    , ((mod4Mask, xK_t), spawn "urxvtc")                                -- urxvt client
    , ((mod4Mask, xK_Right), nextWS)                                    -- next workspace
    , ((mod4Mask, xK_Left), prevWS)                                     -- previous workspace
    , ((mod4Mask, xK_F1), spawn "xmonad_keys.sh")                       -- key help (toggle)
    , ((mod4Mask, xK_F9), spawn "xscreensaver-command -lock && xset dpms force off") -- lock workstation and turn off display
    ]
