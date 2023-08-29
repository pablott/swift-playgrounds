import SwiftUI
import PlaygroundSupport

struct ResetRect: View {
    @State private var sz: CGFloat = 1
    var body: some View {
        Text("\(sz)")
        Button("Reset") {
            sz = 1
        }
        .overlay(
            Rectangle()//.frame(width: sz, height: sz)
    //            .fill(Color.yellow)
                .stroke(Color.red, lineWidth: sz)
                .scaleEffect(sz, anchor: .center)
                .opacity(1)
    //            .id(sz)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: false)) {
                        sz *= 2
                    }
                }
        )
    }
}

struct ContentView: View {
//    @State private var percentAnimated: CGFloat = .zero
    @State private var viewID = true

    var body: some View {
        Text("\(viewID ? "true" : "false")")
            ResetRect()
                .id(viewID)
            Button("Reset id") {
                viewID.toggle()
            }
            //...
//            .onAppear {
//                percentAnimated = 1
//            }
    }

}


PlaygroundPage.current.setLiveView(ContentView())
