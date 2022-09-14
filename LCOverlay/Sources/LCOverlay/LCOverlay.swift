import SwiftUI

public struct LCOverlay<T: View> : View {
    public private(set) var text = "Hello, World!"
    
    public init(isPresented: Binding<Bool>, middleContent: Binding<T>) {
        self._isPresented = isPresented
        self._middleContent = middleContent
    }
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isPresented: Bool
    @State var rotation: Double = 15
    @Binding var middleContent: T
    
    public var body: some View {
//        ZStack {
            
            VStack {
                
                HStack(spacing: 20) {
                    Image(systemName: "gear")
                    Text("Title")
                    Image(systemName: "gear")
                }
                .font(.system(size: 50))
                Spacer()
                
                
                if let mc = middleContent as? Image {
                    mc.resizable().scaledToFit()
                } else {
                    middleContent
                }
                                                                

                Spacer()
                HStack {
                    Button("Ex Button 1", action: {})
                        .padding()
                        .background(.orange)
                        .cornerRadius(25)
                    
                    Button("Dismiss", action: {isPresented = false})
                        .padding()
                        .background(.orange)
                        .cornerRadius(25)
                }
                .buttonStyle(.plain)
                .padding()
//                .foregroundColor(.white)
//                Spacer()
            }
            .frame(width: 300, height: 500, alignment: .center)
            .padding()
            .background(colorScheme == .dark ? Color("lcGray", bundle: Bundle.module) : Color("lcWhite", bundle: Bundle.module))
            .cornerRadius(25)
            
            
//        }
        
        
    }
}
