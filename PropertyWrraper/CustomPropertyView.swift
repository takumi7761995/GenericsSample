//
//  SwiftUIView.swift
//  GenericsSample
//
//

import SwiftUI

struct CustomPropertyView: View {
  @State private var validation = Validation()
  @State private var text: String = ""
  @State private var isPresented = false
  
  var body: some View {
    TextField("", text: $text)
      .textFieldStyle(.roundedBorder)
      .frame(width: 300)
      .onChange(of: text) { newValue in
        plus(newValue.count)
      }
      .alert(isPresented: $isPresented) {
        Alert(title: Text("\(validation.length)文字以内で入力してください"))
      }
  }
  
  private func plus(_ value: Int) {
    validation.length = value
    
    if validation.length < value { // 上限超えたら、エラー
      text.removeLast()
      isPresented = true
    }
  }
}



@propertyWrapper
struct Score {
  private var maximum: Int
  private var number: Int
  
  var wrappedValue: Int {
    get { return number }
    set { number = min(newValue, maximum) }
  }
  
  init() {
    self.maximum = 10
    self.number = 0
  }
  
  init(wrappedValue: Int, maximum: Int) {
    self.maximum = maximum
    self.number = min(wrappedValue, maximum)
  }
}

struct Validation {
  @Score(wrappedValue: 0, maximum: 5) var length: Int
}

struct CustomPropertyView_Previews: PreviewProvider {
  static var previews: some View {
    CustomPropertyView()
  }
}
