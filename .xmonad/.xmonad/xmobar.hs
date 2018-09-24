Config { font = "xft:Bitstream Vera Sans Mono:pixelsize=26:antialias=true"
  , bgColor = "#002b36"
  , fgColor = "#657b83"
  , border = NoBorder
  , borderColor = "black"
  , hideOnStart = False
  , persistent = True
  --, position = Static { xpos = 0, ypos = 0, width = 3720, height = 40 }
  --, position = top
  , lowerOnStart = True
  , commands = [ Run Weather "EGSC" ["-t","<tempC><fc=#93a1a1>c</fc>","-L","64","-H","77","--normal","#93a1a1","--high","#93a1a1","--low","#93a1a1"] 36000
  , Run Network "wlp110s0" ["-t","wifi <rx>kb <tx>kb","-L","0","-H","32","--normal","#657b83","--high","#657b83"] 10
  , Run Cpu ["-t","cpu <total>%","-L","3","-H","50","--normal","#657b83","--high","#657b83"] 10
  , Run Memory ["-t","mem <usedratio>%"] 10
  , Run Date "<fc=#93a1a1>%#a %d-%m %H:%M      </fc>" "date" 10
  --, Run Com "spotifycli" ["--status-short"] "spotify" 10
  , Run Battery ["-t","bat <left>%","--","-O","AC","-o","Bat","-h","green","-l","red"] 10
  , Run StdinReader
]
  , sepChar = "%"
  , alignSep = "}{"
  , template = " %StdinReader% }{ %cpu% | %memory% | %wlp110s0% | %battery% | %EGSC% | %date% "
}
