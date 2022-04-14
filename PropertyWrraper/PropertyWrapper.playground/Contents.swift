import Foundation

@propertyWrapper
struct Score {
  private var maximum: Int
  private var number: Int
  
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, maximum) }
  }
  
  init(wrappedValue: Int, maximum: Int) {
    self.maximum = maximum // selfないとエラー
    self.number = min(wrappedValue, maximum)
  }
}

struct Validation {
  @Score(wrappedValue: 0, maximum: 10) var money: Int
}

let score = Int(Float.random(in:0...1) * 100)
var validation = Validation()
validation.money = score
print(validation.money)
