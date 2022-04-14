import Foundation

struct InitilizeSample {
  let a: Int       // must
  let b: Int = 0   // 0
  let c: Int?      // must
  let d: Int? = 0  // Optional(0)
  
  var e: Int       // must
  var f: Int = 0   // default is 0
  var g: Int?      // default is nil
  var h: Int? = 0  // default is Optional(0)
  
  //  let w: Int { return 0 }   // error: 'let' declarations cannot be computed properties
  //  let y: Int? { return 0 }  // error: 'let' declarations cannot be computed properties
  var i: Int { return 0 }  // computed
  var j: Int? { return 0 } // computed
}

let sample1 = InitilizeSample(a: 1, c: 1, e: 1)
let sample2 = InitilizeSample(a: 1, c: 1, e: 1, f: 1, g: 1, h: 1)

print(sample1)
print(sample2)
