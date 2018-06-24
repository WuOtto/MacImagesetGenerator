## 概述
之前用的一个批量导出APP图标和启动图的软件，今天发现收费了，于是自己造了个简单的轮子。

## 实现
Mac上的`sips`命令，可以很方便的帮助用户修改图片尺寸

Xcode里面的APP启动图资源包含两部分
1. 图片资源
2. 描述文件

所以这个脚本的功能就是两个
1. 生成描述文件`Contents.json`
2. 修改图片尺寸并关联描述文件

### 生成描述文件
使用`echo`简单粗暴的写入
```
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
```

### 修改图片尺寸
```
iconWithSize() {
sips -Z $1 icon.png --out ./AppIcon/icon_$1x$1.png
}
```

### 函数调用
```
mkdir AppIcon
setContents
for size in  40 58 60 80 87 120 180 1024
do
iconWithSize $size
done
```

![](http://ouem5hcj9.bkt.clouddn.com/AppIcon2.png)

![](http://ouem5hcj9.bkt.clouddn.com/AppIcon3.png)

## 效果展示
![](http://ouem5hcj9.bkt.clouddn.com/AppIcon.png?123)

![](http://ouem5hcj9.bkt.clouddn.com/LaunchImage.png)

## 怎么使用
### AppIcon
下载对应的`sh`文件，放到你想导出图片的目录下，将你的原图命名为`icon.png`，然后在控制台中进入该目录，执行
```
sh AppIcon.sh
```

### LaunchImage
下载对应的`sh`文件，放到你想导出图片的目录下，将你的原图命名为`default.png`，然后在控制台中进入该目录，执行
```
sh AppLaunch.sh
```

就可以得到你要的资源啦。

