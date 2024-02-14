# VaakaR 0.02.14

## create_email_as_json improvements and HexSticker design

* `create_email_as_json()` improvements, see changes at reference page.
* hexSticker was created
  - HexSticker: *inst/hexbin/VaakaRsticker.png*
    - "In the world of data analysis, VaakaR has emerged as a symbol of precision and insight. Its hex sticker and logo were meticulously designed, featuring a hexagonal pattern representing stability and clarity in yellow. Light blue fonts ensure readability. At the center of the design, the determined woman's face reflects the package's dedication to analysis. Behind her stands a steadfast house, symbolizing the foundation of data-driven decision-making. Refined through feedback, VaakaR's visual identity now stands as a testament to empowering data enthusiasts on their analytical journeys, anchored by the principles of clarity, stability, and determination." - VaakaR Art Director
    - HexSticker copied also to docs/ folder (ref from README.md)
      - removed and added back to: *inst/hexbin/VaakaRsticker.png*
      - in DESCRIPTION: HexSticker: docs/VaakaRsticker.png 
  - updated: *.Rbuidignore* 
    - ^docs$ (directory is necessary for your package and contains relevant documentation)
    - ^main_VaakaR_package_creation.R
    - ^inst$ (not deleted: note that docs-folder is not in git)
* Path for library (Rstudio)
  * "C:/Rlib" created
  * `.libPaths(c("C:/Rlib",.libPaths()))`
  * `.libPaths()`

# VaakaR 0.02.12

## UTF-8 encoding

* `create_email_as_json()` correct encoding. Argument: *writewith*.

# VaakaR 0.02.11

## First function

* `create_email_as_json()`
  * Relates on (@vaakaruode/VaakaR, #1)
  * [VaakaR/issues/1](https://github.com/vaakaruode/VaakaR/issues/1)
                                         
