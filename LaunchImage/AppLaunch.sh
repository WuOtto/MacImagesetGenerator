#!/bin/sh

Contents(){

echo {  >> ./LaunchImage/Contents.json
echo "  \"images\"" : [>> ./LaunchImage/Contents.json
echo "   "{>> ./LaunchImage/Contents.json
echo "      \"extent\"" : "\"full-screen\"",>> ./LaunchImage/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./LaunchImage/Contents.json
echo "      \"subtype\"" : "\"2436h\"",>> ./LaunchImage/Contents.json
echo "      \"filename\"" : "\"Default1125x2436.png\"",>> ./LaunchImage/Contents.json
echo "      \"minimum-system-version\"" : "\"11.0\"",>> ./LaunchImage/Contents.json
echo "      \"orientation\"" : "\"portrait\"",>> ./LaunchImage/Contents.json
echo "      \"scale\"" : "\"3x\"">> ./LaunchImage/Contents.json
echo "   "},>> ./LaunchImage/Contents.json
echo "   "{>> ./LaunchImage/Contents.json
echo "      \"extent\"" : "\"full-screen\"",>> ./LaunchImage/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./LaunchImage/Contents.json
echo "      \"subtype\"" : "\"736h\"",>> ./LaunchImage/Contents.json
echo "      \"filename\"" : "\"Default1242x2208.png\"",>> ./LaunchImage/Contents.json
echo "      \"minimum-system-version\"" : "\"8.0\"",>> ./LaunchImage/Contents.json
echo "      \"orientation\"" : "\"portrait\"",>> ./LaunchImage/Contents.json
echo "      \"scale\"" : "\"3x\"">> ./LaunchImage/Contents.json
echo "   "},>> ./LaunchImage/Contents.json
echo "   "{>> ./LaunchImage/Contents.json
echo "      \"extent\"" : "\"full-screen\"",>> ./LaunchImage/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./LaunchImage/Contents.json
echo "      \"subtype\"" : "\"667h\"",>> ./LaunchImage/Contents.json
echo "      \"filename\"" : "\"Default750x1334.png\"",>> ./LaunchImage/Contents.json
echo "      \"minimum-system-version\"" : "\"8.0\"",>> ./LaunchImage/Contents.json
echo "      \"orientation\"" : "\"portrait\"",>> ./LaunchImage/Contents.json
echo "      \"scale\"" : "\"2x\"">> ./LaunchImage/Contents.json
echo "   "},>> ./LaunchImage/Contents.json
echo "   "{>> ./LaunchImage/Contents.json
echo "      \"extent\"" : "\"full-screen\"",>> ./LaunchImage/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./LaunchImage/Contents.json
echo "      \"filename\"" : "\"Default640x960.png\"",>> ./LaunchImage/Contents.json
echo "      \"minimum-system-version\"" : "\"7.0\"",>> ./LaunchImage/Contents.json
echo "      \"orientation\"" : "\"portrait\"",>> ./LaunchImage/Contents.json
echo "      \"scale\"" : "\"2x\"">> ./LaunchImage/Contents.json
echo "   "},>> ./LaunchImage/Contents.json
echo "   "{>> ./LaunchImage/Contents.json
echo "      \"extent\"" : "\"full-screen\"",>> ./LaunchImage/Contents.json
echo "      \"idiom\"" : "\"iphone\"",>> ./LaunchImage/Contents.json
echo "      \"subtype\"" : "\"retina4\"",>> ./LaunchImage/Contents.json
echo "      \"filename\"" : "\"Default640x1136.png\"",>> ./LaunchImage/Contents.json
echo "      \"minimum-system-version\"" : "\"7.0\"",>> ./LaunchImage/Contents.json
echo "      \"orientation\"" : "\"portrait\"",>> ./LaunchImage/Contents.json
echo "      \"scale\"" : "\"2x\"">> ./LaunchImage/Contents.json
echo "   "}>> ./LaunchImage/Contents.json
echo " "],>> ./LaunchImage/Contents.json
echo "  \"info\"" : {>> ./LaunchImage/Contents.json
echo "     \"version\"" : 1,>> ./LaunchImage/Contents.json
echo "     \"author\"" : "\"xcode\"">> ./LaunchImage/Contents.json
echo " "}>> ./LaunchImage/Contents.json
echo }>> ./LaunchImage/Contents.json

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


