#!/bin/sh

Contents(){
cat <<EOF >./LaunchImage/Contents.json
 {  
    "images" : [
    {
       "extent" : "full-screen",
       "idiom" : "iphone",
       "subtype" : "2436h",
       "filename" : "Default1125x2436.png",
       "minimum-system-version" : "11.0",
       "orientation" : "portrait",
       "scale" : "3x"
    },
    {
       "extent" : "full-screen",
       "idiom" : "iphone",
       "subtype" : "736h",
       "filename" : "Default1242x2208.png",
       "minimum-system-version" : "8.0",
       "orientation" : "portrait",
       "scale" : "3x"
    },
    {
       "extent" : "full-screen",
       "idiom" : "iphone",
       "subtype" : "667h",
       "filename" : "Default750x1334.png",
       "minimum-system-version" : "8.0",
       "orientation" : "portrait",
       "scale" : "2x"
    },
    {
       "extent" : "full-screen",
       "idiom" : "iphone",
       "filename" : "Default640x960.png",
       "minimum-system-version" : "7.0",
       "orientation" : "portrait",
       "scale" : "2x"
    },
    {
       "extent" : "full-screen",
       "idiom" : "iphone",
       "subtype" : "retina4",
       "filename" : "Default640x1136.png",
       "minimum-system-version" : "7.0",
       "orientation" : "portrait",
       "scale" : "2x"
    }
    ],
      "info" : {
        "version" : 1,
        "author" : "xcode"
    }
 }
EOF
}

setImage(){
    sips -z 960 640 default.png --out ./LaunchImage/Default640x960.png
    sips -z 1136 640 default.png --out ./LaunchImage/Default640x1136.png
    sips -z 1334 750 default.png --out ./LaunchImage/Default750x1334.png
    sips -z 2436 1125 default.png --out ./LaunchImage/Default1125x2436.png
    sips -z 2208 1242 default.png --out ./LaunchImage/Default1242x2208.png
}

#调用函数
mkdir LaunchImage
Contents
setImage


