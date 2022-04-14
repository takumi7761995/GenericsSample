import UIKit

struct LazySample {
  var num: Int = 1
  var num2: Int = 2
  
//  lazyがない場合との差を確認したい場合は、下記のコメントを外してください
//  var total = num + num2
//  var total2 = total * 2
  
  lazy var total = num + num2
  lazy var total2 = total * 2
}


//let sample = LazySample() // error: change 'let' to 'var' to make it mutable
var sample = LazySample()
print(sample)
print(sample.total)
print(sample.total)
print(sample.total2)
