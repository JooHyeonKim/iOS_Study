import UIKit


struct User{
    var nickname:String
    var age:Int
    
    init(nickname:String, age:Int){
        self.nickname = nickname
        self.age = age
    }
    
    init(age:Int){
        self.nickname = "beomhee"
        self.age = age
    }
    
    func info(){
        print("\(nickname) + \(age)")
    }
}

var user = User(nickname: "judy", age: 23)
var user2 = User(age: 30)
print(user2)
print(user.nickname)
user.info()

class Dog{
    var name:String = "choco"
    var age: Int = 14
    
    init(){
        
    }
    
    func info(){
        print("Name \(name) age \(age)")
    }
}

var dog = Dog()

dog.info()


struct Stock {
    
    var avgPrice: Int
    var quantity: Int
    var purchasePrice: Int{
        
        get{
            return avgPrice * quantity
        }
        
        set(newPrice){
            avgPrice = newPrice/quantity
        }
    }
}

var stock = Stock(avgPrice: 3000, quantity: 3)
stock.purchasePrice
stock.purchasePrice = 9000
stock.avgPrice


class Account {
    var credit:Int = 0 {
        willSet{
            print("값이 \(credit)에서 \(newValue)로 변경될 예정")
        }
        
        didSet{
            print("값이 \(oldValue)에서 \(credit)로 변경됨")
        }
    }
}
var acc = Account()
acc.credit = 1000


class SomeClass {
    var num:Int = 0
}

var c1 = SomeClass()
var c2 = c1

c1.num = 100

c2.num
