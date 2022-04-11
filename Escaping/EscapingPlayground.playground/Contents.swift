import Foundation

class EscapingSample {
  var closure = { () -> () in print("good") }
  
  func sample1(with completion: @escaping (() -> Void)) {
    closure = completion
  }
  
  func sample2(with completion: @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
      completion()
    }
  }
  
  func sample3(with completion: @escaping (() -> Void)) {
    runAsyncTask {
      completion()
    }
  }
  
  func runAsyncTask(completion: @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
      completion()
    }
  }
}

let test = EscapingSample()

test.closure()

test.sample1 {
  print("sample1 was completed")
}

test.sample2 {
   print("sample2 was completed")
}

test.sample3 {
  print("sample3 was completed")
}
