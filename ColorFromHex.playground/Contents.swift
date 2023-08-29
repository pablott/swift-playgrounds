//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ColorPicker: View {
    let colors: [Colors] = Colors.allCases
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color.getColor())
                    .border(.black, width: 1)
                    .frame(width: 32, height: 32)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ColorPicker())



enum Colors: Int, CaseIterable {
    case white = 0xFFFFFF
    case black = 0x000000
    case blue = 0x3D26CE
    case purple = 0x9826CE
    case cyan = 0x91D2E7
    case green = 0x26CE5F
    case yellow = 0xFBE51E
    case orange = 0xCE7726
    case brown = 0x613515

    func getColor() -> Color {
        Color.from(hex: self.rawValue)
    }
}

extension Color {
    static func from(hex: Int) -> Color {
        let red = (hex >> 16) & 0xFF
        let green = (hex >> 8) & 0xFF
        let blue = hex & 0xFF
        
        let normalizedRed = CGFloat(red) / 255.0
        let normalizedGreen = CGFloat(green) / 255.0
        let normalizedBlue = CGFloat(blue) / 255.0
        
        let color = Color(red: normalizedRed, green: normalizedGreen, blue: normalizedBlue)
        return color
    }
}
