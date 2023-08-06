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


var n=6
repeat {
    n+=2
}while n<5

print(n)


//옵셔널 : 값이 있을 수도 있고 없을 수도 있다.
//nil : 값이 없음.
//옵셔널 타입으로 변수를 생성하려면 타입뒤에 ?를 붙이면 된다.

var number: Int? = nil
print(number)

var name:String?

var optionalName: String? = "Joohyeon"
print(optionalName)

//var Name:String = optionalName
//Error! Value of optional type 'String?' must be unwrapped to a value of type 'String'

//Optional("Joohyeon") 옵셔널로 포장되어있다. 이상태로는 다른 변수와 연산 불가.
//옵셔널 바인딩 = 포장지를 뜯는 작업


var num: Int? = 3
print(num) //Optional(3)
print(num!) //3


//if let : 추출된 결과 result는 if문 내에서만 사용 가능
if let result = num{  //result : optional에서 추출된 결과
    print(result) //값 추출성공
}else{ //값 추출실패
    print("추출실패")
}

//guard문으로 optional binding
func test(){
    let number:Int? = 452
    guard let result = number else { return }
    print(result) //guard문을 사용하면 함수 전체에서 추출된 변수 사용 가능
}

test()

//명시적
let value: Int? = 6

if value == 6{ //옵셔널 해제
    print("value가 6")
}else{
    print("6이 아니다.")
}

//!: 묵시적 optional 해제
let string = "12" //문자가 들어오게 되면 nil을 반환.
let stringToInt:Int! = Int(string) //타입이 optional이어야함.
print(stringToInt+1)


