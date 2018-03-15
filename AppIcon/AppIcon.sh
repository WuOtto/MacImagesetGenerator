#!/bin/sh

iconWithSize() {
sips -Z $1 icon.png --out ./AppIcon/icon_$1x$1.png
}

setContents(){
echo {  >> ./AppIcon/Contents.json
echo "  \"images\"" : [>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"20x20\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"2x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_40x40.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"20x20\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"3x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_60x60.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"29x29\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"2x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_58x58.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"29x29\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"3x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_87x87.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"40x40\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"2x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_80x80.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"40x40\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"3x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_120x120.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"60x60\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"2x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_120x120.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"60x60\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"3x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_180x180.png\"">> ./AppIcon/Contents.json
echo "   "},>> ./AppIcon/Contents.json
echo "   "{>> ./AppIcon/Contents.json
echo "      \"size\"" : "\"1024x1024\"",>> ./AppIcon/Contents.json
echo "      \"idiom\"" : "\"ios-marketing\"",>> ./AppIcon/Contents.json
echo "      \"scale\"" : "\"1x\"",>> ./AppIcon/Contents.json
echo "      \"filename\"" : "\"icon_1024x1024.png\"">> ./AppIcon/Contents.json
echo "   "}>> ./AppIcon/Contents.json
echo " "],>> ./AppIcon/Contents.json
echo "  \"info\"" : {>> ./AppIcon/Contents.json
echo "     \"version\"" : 1,>> ./AppIcon/Contents.json
echo "     \"author\"" : "\"xcode\"">> ./AppIcon/Contents.json
echo " "}>> ./AppIcon/Contents.json
echo }>> ./AppIcon/Contents.json
}

mkdir AppIcon
setContents
for size in  40 58 60 80 87 120 180 1024
do
iconWithSize $size
done
