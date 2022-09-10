import SwiftUI

//@available(iOS 15.0, *)
//@available(macOS 10.15, *)
public struct BasicLoginScreen: View {
                
    @Binding var title: String
    @Binding var authBool: Bool
    @Binding var userView: AnyView
    
    public var body: some View {
        LoginView(title: $title, hasAccess: $authBool, customUserTitle: $userView)
    }
    
    
}






extension BasicLoginScreen {
    public init(title: Binding<String>, authBool: Binding<Bool>) {
        self._authBool = authBool
        self._title = title
        self._userView = .constant(AnyView(Text("anyview defualt")))
    }
    
    public init(authBool: Binding<Bool>) {
        self._authBool = authBool
        self._userView = .constant(AnyView(Text("anyview defualt")))
        self._title = .constant("Login, Hoe")
    }
    
    public init(yourTitleView: Binding<AnyView>, authBool: Binding<Bool>) {
        self._authBool = authBool
        self._title = .constant("-x9@kfj")
        self._userView = yourTitleView
    }
    
    public init(data: LC_LoginViewData) {
        self._authBool = .constant(data.authBool)
        self._title = .constant(data.title)
        self._userView = .constant(data.view)
    }
}

public struct LC_LoginViewData {
    var title: String
    var authBool: Bool
    var view: AnyView
    
    public init(title: String = "Default Title struct", authBool: Bool = false, view: AnyView = AnyView(Text("Default Struct"))) {
        self.title = title
        self.authBool = authBool
        self.view = view
    }
}
