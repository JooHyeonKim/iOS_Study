import UIKit

var greeting = "Hello, playground"

for i in 0...99{
    print(i)
}

var numbers: Array<Int> = Array<Int>()
numbers.append(1)
numbers.append(2)
numbers.append(3)


numbers.insert(4, at:2)
numbers.remove(at: 0)
numbers


var dic:[String: Int] = ["김주현":1]
dic["강하연"] = 3
dic["김가연"] = 4
dic["조범희"] = 10

dic

dic.removeValue(forKey: "김가연")
dic

var set: Set = Set<Int>()
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set.insert(30)

set

set.remove(20)
set

func sum(a:Int, b:Int) -> Int{
    return a+b
}
sum(a:5, b:3)

func mult(x:Int, y:Int) -> Int{
    return x*y
}
mult(x: 5, y: 10)

func hello() -> String{
    return "hello"
}
hello()

func printName(friend:String, me:String = "gunter") ->Void{
    print("Hello \(friend)! I'm \(me)")
}

printName(friend: "Joohyeon")

func sendMessage(_ myName:String, _ name:String) -> String{
    return "Hello \(name)! I'M \(myName)."
}

sendMessage("Joohyeon", "beombhee")


func sendMessage(_ me: String, _ friends: String ...) -> String {
    
    return "Hello \(friends)! I'm \(me)"
}

sendMessage("jh", "bh", "hy", "gy")


let age = 22

if age < 19{
    print("미성년자 입니다.")
} else {
    print("성인입니다.")
}


let animal = "dog"

if animal == "dog"{
    print("강아지 사료 주기")
}else if animal == "cat"{
    print("고양이 사료 주기")
}else{
    print("해당하는 동물 사료가 없음.")
}


let color = "green"

switch color {
    
case "blue":
    print("파란색")
    
case "green":
    print("초록색")
    
case "yellow":
    print("노란색")
    
default:
    print("찾는 색상이 없습니다.")
}


let temp = 100

switch temp {
case -20...9:
    print("겨울")

case 10...14:
    print("가을")
    
case 15...25:
    print("봄")
    
case 26...35:
    print("여름")
    
default:
    print("이상기후")
}


for i in 1...4{
    print(i)
}

let array = [1,2,3,4,5]


for i in array{
    print(i)
}

var num = 5

while num < 10 {
    num+=1
}

num

var x = 6

repeat{
    x += 2
}while x < 5

print(x)
