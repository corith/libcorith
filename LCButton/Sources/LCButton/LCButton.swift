import SwiftUI

public struct LCButton: View {
    public private(set) var text = "Hello, World!"

    public init(systemImage: String, bgColor: Color = .orange, action: @escaping () -> Void) {
        self.systemImage = systemImage
        self.bgColor = bgColor
        self.action = action
    }
    
    
    public var systemImage: String?
    public var bgColor: Color?
    public var action: () -> Void
    
    public var body: some View {
        Button(action: action, label: {
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
