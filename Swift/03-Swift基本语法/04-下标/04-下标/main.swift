//
//  main.swift
//  04-下标


import Foundation

/*
subscripts(下标): 访问(结构体)对象中数据的快捷方式
所谓下标脚本语法就是能够通过, 实例[索引值]来访问实例中的数据
类似于以前我们访问数组和字典, 其实Swift中的数组和字典就是一个结构体

Array: public subscript (index: Int) -> Element
--> arr[0]

Array: public subscript (subRange: Range<Int>) -> ArraySlice<Element>
--> arr[Range(start: 0, end: 1)]

Dictionary: public subscript (key: Key) -> Value?
--> dict["key"]
*/

struct Person {
    var name: String
    var number: String
    var age: Int
    
    // 要想实现下标访问, 必须实现subscript方法
    // 如果想要通过下标访问, 必须实现get方法
    // 如果想要通过下表赋值, 必须实现set方法
    subscript (key: String) -> AnyObject?
    {
        get {
            switch key {
                case "name":
                   return name
                
                case "number":
                   return number
                
                case "age":
                   return age
                
                default:
                   return nil
            }
        }
        
        set {
            switch key {
                case "name":
                    // newValue是一个AnyObject类型
                    name = String(newValue)
                
                case "number":
                    number = String(newValue)
                
                case "age":
                    age = newValue as! Int
                
                default:
                    print("key 输入错误")
            }
        }
    }
}

var person = Person(name: "dahuan", number: "110", age: 18)
// 根据下标修改值
person["number"] = "120"

// 根据下标获取值
print(person["number"])


/*
Swift中是允许多索引的下标的
*/
struct Math {
    subscript (num1: Int, num2: Int) ->Int
    {
        return num1 * num2
    }
}

var math = Math()
print(math[2, 3])


