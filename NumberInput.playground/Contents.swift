import SwiftUI
import PlaygroundSupport
import Combine


class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var input = NumbersOnly()
    
    var body: some View {
        TextField("Input", text: $input.value)
            .padding()
            .keyboardType(.decimalPad)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
