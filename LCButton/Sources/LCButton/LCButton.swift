import SwiftUI

public struct LCButton: View {
    public private(set) var text = "Hello, World!"

    public init(systemImage: String, bgColor: Color = .orange) {
        self.systemImage = systemImage
        self.bgColor = bgColor
    }
    
    
    
    public var systemImage: String?
    public var bgColor: Color?
    
    public var body: some View {
        Button(action: {
            print("YUR")
        }, label: {
            Image(systemName: systemImage ?? "bolt.circle")
                .font(.system(size: 100))
                .foregroundColor(.mint)
        })
        .padding()
        .background(bgColor)
        .opacity(0.8)
        .cornerRadius(25)
    }
}
