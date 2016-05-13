//
//  main.swift
//  07-字符和字符串


import Foundation

/**
字符
OC: char charValue = 'a';
Swift: var charValue: Character = "a"

扩展：
Unicode 是文本编码和表示的国际标准，可以用标准格式来表示几乎所有语言的字符

Swift和OC字符不同点：
1.Swift是用双引号
2.OC中的字符占一个字节,因为它只包含ASCII表中的字符,
Swift中的字符除了可以存储ASCII表中的字符还可以存储unicode字符,

var charValue: Character = "🐶"    // 正确
var charValue: Character = "欢"    // 正确
var charValue: Character = "大欢"  // 错误
注意: 字符的双引号中只能放一个字符
*/

/**
字符串:
字符串是多个字符的集合, 想要存放多个字符需要使用字符串

比较OC和Swift中字符串的差异:
OC：NSString，是一个 OC 对象，性能略差
NSString *stringValue = @"大欢";

Swift：String，是一个结构体，性能更高
var stringValue: String = "大欢"

注意：
1.OC字符串有 @ , Swift字符串没有 @
2.在 Swift 中绝大多数的情况下，推荐使用 String 类型，同时 Swift 也提供了 String 和 NSString 之间的无缝转换
*/
// 在Swift中使用NSString
let string: NSString = NSString(string: "huanhuan")

/**
OC语言中的字符串也是以\0结尾的, 例如:
NSString *stringValue = @"abc\0def";
NSLog(@"%@", stringValue);  -> 打印结果为abc

Swift中不是以\0结尾的，例如：
var stringValue = "abc\0def";
print(stringValue) -> 打印结果为abcdef

在Swift中 \" 是代表双引号, \' 代表单引号，例如：
var str = "\"双引号"
print(str)  ->输出结果为 "双引号

var str = "\'单引号"
print(str) ->输出结果为 '单引号
*/

// 添加双引号
let str = "双\"引号"
print(str)  // 输出结果： 双"引号

// 添加单引号
let str1 = "单\'引号"
print(str1)  // 输出结果： 单'引号


// 字符串常用方法
// 1.初始化空支字符串
let emptyString1 = ""
let emptyString2 = String()

// 2.遍历字符串
var str2 = "大欢是我们的好朋友!"
for s in str2.characters {
    print(s)
}

// 3.获取字符串的长度
let count = str2.characters.count
print(count)

// 4.判断字符串是否为空(isEmpty)
let emptyStr = ""
if emptyStr.isEmpty {
    print("字符串是否为空")
}

// 5.字符串拼接
let str4 = "大欢"
let str5 = "是我们的好朋友！"
let result = str4 + str5
print(result)

var str6 = "大欢,"
str6 += str5  // 等于 str6 = str6 + str5
print(str6)

/*
把字符串赋值给一个变量，就可以修改，赋值给一个常量，就不能修改。
var修饰String，相当于OC中的NSMutableString
let修饰String，相当于OC中的NSString
*/

// 6.格式化字符串
let str7 = "爱情"
let str8 = "因为\(str7)，所以不会悲伤"
print(str8)

print("str7: \(str7)  str8: \(str8)")

// 取小数点后两位
let pi = 3.1415926
let result1 = String(format:"%.2f", pi)
print(result1)

// 7.字符串比较
// == , != , >= , > , <= , < , 和C语言的strcmp一样是逐个比较
let str9 = "abc"
let str10 = "abc"
if str9 == str10 {
    print("相等")
}

// 8.判断前后缀
let str11 = "www.baidu.com"
if str11.hasPrefix("www") {
    print("包含前缀www")
}

if str11.hasSuffix("com") {
    print("包含后缀com")
}

// 9.大小写转换
let str12 = str11.uppercaseString
let str13 = str12.lowercaseString

print("大写: \(str12)  小写: \(str13)")

// 10.转换为基本数据类型
let str14 = "5.20"
let num = Float(str14)
print("str14: \(num)")

/**
注意：
Float(str)返回的是可选类型，如果str不能转换为整数, 那么可选类型返回nil
str = "5.20吗" 不能转换成功，所以转换后结果为nil
*/

// 11.截取字符串
var str15 = "大欢是我们的好朋友!"

// 截取 “大欢”
// str15.startIndex 从0开始
// 注意： advancedBy接受的值为正数，从0开始
let startIndex = str15.startIndex.advancedBy(2)
// 注意：substringToIndex需要的是Index类型，不是Int类型
let toStr = str15.substringToIndex(startIndex)
print(toStr)

// 截取 “好朋友!”
// 注意：advancedBy接受的值为负数
let endIndex = str15.endIndex.advancedBy(-4)
let fromStr = str15.substringFromIndex(endIndex)
print(fromStr)

// 截取 “我们”
let startIndex1 = str15.startIndex.advancedBy(3)
let endIndex1 = str15.endIndex.advancedBy(-5)
let range: Range<String.Index> = Range(start: startIndex1, end: endIndex1)
let rangeStr = str15.substringWithRange(range)

print(rangeStr)

// 截取字符串建议写法
// OC代码的实现
// 截取 “大欢”
let toStr1 = (str15 as NSString).substringToIndex(2)
print("toStr1: \(toStr1)")

// 截取 “好朋友!”
let fromStr1 = (str15 as NSString).substringFromIndex(6)
print("fromStr1: \(fromStr1)")

// 截取 “我们”
let range1 = NSRange(location: 3, length: 2)
let rangeStr1 = (str15 as NSString).substringWithRange(range1)
print("rangeStr1: \(rangeStr1)")
