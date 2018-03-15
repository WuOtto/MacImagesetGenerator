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
![](http://ouem5hcj9.bkt.clouddn.com/AppIcon.png)

![](http://ouem5hcj9.bkt.clouddn.com/LaunchImage.png)

## 怎么使用
下载对应的`sh`文件，放到你想导出图片的目录下，将你的原图命名为`icon.png`，然后在控制台中进入该目录，执行
```
sh AppIcon.sh
```

就可以得到你要的资源啦。

## 扩展
### 在命令行使用`sips`命令修改图片尺寸
#### 重新定义单个图片尺寸（忽略比例）
```
sips -z 768 1024 xxx.png

修改后图片尺寸为1024x768
```

#### 重新定义单个图片尺寸（保留比例）
```
sips -Z 500 xxx.png
```
==保留图片比例，宽高不超过500。注意是大写的Z==。要想保留图片原始比例就得这样做，比如你有一张尺寸为`750 x 1334`的图片，执行完上面这条命令后，图片尺寸就变成了`281x500`

#### 在一个目录里批量修改同一后缀格式的图片尺寸
```
sips -Z 300 *.png
```
只需要用`*`作为通配符来代替图片名就可以了

#### 使用shell脚本批量导出appicon
```
#!/bin/sh

IconWithSize() {
#-Z 等比例按照给定尺寸缩放最长边。
sips -Z $1 icon.png --out icon_$1x$1.png
}

for size in  29 40 50 57 58 60 72 76 80 87 100 114 120 144 152 180
do
IconWithSize $size
done
```
