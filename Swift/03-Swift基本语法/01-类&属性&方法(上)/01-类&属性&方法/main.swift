//
//  main.swift
//  01-类&属性&方法


import Foundation

/*
类：
Swift中的结构体和类非常相似, 但是又有很多不同

类格式:
class 类名称 {
类的属性和方法
}
*/


// 声明一个类
class Person {
    // 普通存储属性
    var name: String = "dahuan"
    var age: UInt8 = 18
    
    // 对象方法
    func show()
    {
        // 注意，在swift中，能不用self就尽量不要使用self
        // 在闭包中使用一个全局属性，就不能够省略self
        // 在方法中，如果方法的参数和全局属性重名，为了区分也不能够省略self
        print("name: \(name), age: \(age)")
    }
}

// 1.类没有逐一构造器
//var person: Person = Person(name: "huanhuan", age: 19)  // 错误


// 2.类是引用类型
// 注意：结构体和枚举都是值类型，类是引用类型
// 对象之间的赋值其实是将person1指向了person2的存储控件, 所以他们是两个指向同一块存储空间, 修改其中一个必然会影响到另外一个
var person1 = Person()
var person2 = person1

// 输出结果为 name: dahuan, age: 18
person1.show()
// 输出结果为 name: dahuan, age: 18
person2.show()

// 修改person2种属性的值
person2.name = "xiaohua"

// 输出结果为 name: xiaohua, age: 18
person1.show()
// 输出结果为 name: xiaohua, age: 18
person2.show()


/*
恒等运算符
用于判断是否是同一个实例, 也就是是否指向同一块存储空间
=== !==
*/

if person1 === person2 {
    print("person1和person2指向同一块存储空间")
}

var person3 = Person()
if person1 !== person3 {
    print("person1和person3指向不是同一块存储空间")
}


/*
Swift中的对象属性：
*/

/*
常量存储属性:
类和结构体一样，常量存储属性只能在定义时或构造时修改，构造好一个对象后不能对常量存储属性做修改
*/

class Person1 {
    // 普通存储属性
    var name: String = "大欢"
    // 常量存储属性
    let age: UInt8 = 18
}

var person4 = Person1()
person4.name = "小欢"

// 构造好对象之后不能修改常量存储属性
//person4.age = 38  // 错误


/*
类常量
因为结构体和枚举都是值类型，用常量(let)来修饰对象，不能修改结构体常量对象中属性的值(因为指向的对象是一个常量)，也不能修改常量的指向
因为类是引用类型，用常量(let)来修饰对象，可以修改对象中属性的值(因为指向的对象不是一个常量)，不可以修改类常量的指向
注意：结构体和枚举都是值类型，类是引用类型
*/

class Person3 {
    // 普通存储属性
    var name: String = "dahuan"
    var age: UInt8 = 18
}

// 构造一个类常量对象
let person5 = Person3()

// 可以修改类常量中的值, 因为他指向的对象不是一个常量
person5.age = 100
person5.name = "xiaohuan"


