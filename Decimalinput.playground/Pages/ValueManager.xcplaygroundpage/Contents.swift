import SwiftUI
import PlaygroundSupport

class ValueManager: ObservableObject {
    @Published var value: String = "" {
        didSet {
            let decimalRegex = #"^\d*\.?\d*$"#
            if !value.isEmpty && !value.matches(decimalRegex) {
                value = oldValue
            }
        }
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return range(of: regex, options: .regularExpression) != nil
    }
}

struct DecimalInputView: View {
    @ObservedObject var valueManager: ValueManager
    
    var body: some View {
        Text(valueManager.value)
        TextField("Enter a decimal value", text: $valueManager.value)
            .keyboardType(.decimalPad)
    }
}

struct ContentView: View {
    @StateObject private var valueManager = ValueManager()
    
    var body: some View {
        VStack {
            Text("Decimal Value Input:")
            DecimalInputView(valueManager: valueManager)
                .padding()
        }
    }
}

// Live preview in Playground
let contentView = ContentView()
PlaygroundPage.current.setLiveView(contentView)
