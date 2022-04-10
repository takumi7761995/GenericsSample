import Foundation

class EscapingSample {
  var closure = { () -> () in print("good") }
//  var closure2: () -> Void
  
  func sample1(with completion: @escaping (() -> Void)) {
    closure = completion // スコープ外のプロパティに代入 → コンパイルエラー
  }
  
  func sample2(with completion: @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
      completion() // 非同期処理内での実行はスコープ外 → コンパイルエラー
    }
  }
  
  func sample3(with completion: @escaping (() -> Void)) {
    runAsyncTask {
      completion() // 非同期処理内での実行はスコープ外 → コンパイルエラー
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
