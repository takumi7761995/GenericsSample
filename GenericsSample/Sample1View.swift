//
//  ContentView.swift
//  GenericsSample
//

import SwiftUI

struct Sample1View<Content: View>: View {
  //  let content: () -> Content
  @ViewBuilder let content: () -> Content
  
  var body: some View {
    content()
  }
}

struct Sample1View_Previews: PreviewProvider {
  static var previews: some View {
    Sample1View {
      Text("aaa")
      Text("bbb")
    }
  }
}
