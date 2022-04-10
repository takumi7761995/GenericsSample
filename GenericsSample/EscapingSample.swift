//
//  EscapingSample.swift
//  GenericsSample
//
//  Created by 杉本匠 on 2022/04/11.
//

import Foundation

// This is the case without @escaping
// try to give them @escaping
class EscapingSample {
  var closure: (() -> Void)?
  
  func sample1(with completion: (() -> Void)) {
    closure = completion // スコープ外のプロパティに代入 → コンパイルエラー
  }
  
  func sample2(with completion: (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
      completion() // 非同期処理内での実行はスコープ外 → コンパイルエラー
    }
  }
  
  func sample3(with completion: (() -> Void)) {
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
