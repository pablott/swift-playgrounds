import SwiftUI
import Combine
import PlaygroundSupport

struct DecimalInputView: View {
    @State private var inputValue: String = ""
    
    var body: some View {
        TextField("Enter a decimal value", text: $inputValue)
            .keyboardType(.decimalPad)
            .onReceive(Just(inputValue)) { newValue in
                let filtered = newValue.filter { "0123456789.".contains($0) }
                if filtered != newValue {
                    self.inputValue = filtered
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Decimal Value Input:")
            DecimalInputView()
                .padding()
        }
    }
}

// Live preview in Playground
let contentView = ContentView()
PlaygroundPage.current.setLiveView(contentView)
