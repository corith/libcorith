import SwiftUI

public struct BasicLoginScreen<TitleView: View, LoginMsg: View>: View {
    @State var userNColor: Color = Color("loginIdColor")
    @State private var pwdColor: Color = Color("pwdColor")
    @Binding var title: String
    @Binding var authBool: Bool
    @Binding var titleView: TitleView
    @Binding var loginMsg: LoginMsg
    
    public var body: some View {
        LoginView<TitleView, LoginMsg>(title: $title, hasAccess: $authBool, titleView: $titleView, loginMsg: $loginMsg, userNColor: $userNColor, pwdColor: $pwdColor)
    }
    
}


extension BasicLoginScreen {
    
    public init(titleString: String = "Title", loginMsg: String = "Login Message", authBool: Binding<Bool>) {
        self._title = .constant(titleString)
        self._loginMsg = .constant(Text("\(loginMsg)") as! LoginMsg)
        self._authBool = authBool
        self._titleView = .constant(Text("") as! TitleView)
    }
    
    public init(titleView: TitleView = Text("Default Title View") as! TitleView, loginMsg: LoginMsg = Text("Login Message") as! LoginMsg, authBool: Binding<Bool>) {
        self._title = .constant("-x9@kfj")
        self._titleView = .constant(titleView)
        self._loginMsg = .constant(loginMsg)
        self._authBool = authBool
    }
    
    public init(titleView: TitleView = Text("Default Title View") as! TitleView, loginMsg: String, authBool: Binding<Bool>) {
        self._title = .constant("-x9@kfj")
        self._titleView = .constant(titleView)
        self._loginMsg = .constant(Text("\(loginMsg)") as! LoginMsg)
        self._authBool = authBool
    }
    
    public init(yourTitleView: Binding<String>, authBool: Binding<Bool>) {
        self._authBool = authBool
        self._title = yourTitleView
        self._titleView = .constant(Text("String Binding Title View") as! TitleView)
        self._loginMsg =  .constant(Text("") as! LoginMsg)
    }
    
    /// init for creating a base model login screen. Basically Demo / Placeholder values
    /// - Parameter authBool: the Boolean presumably tied to a @State variable tracking if
    /// a user has been granted access or not.
    public init(authBool: Binding<Bool>) {
        self._authBool = authBool
        self._titleView = .constant(Text("Default nothing but authBool") as! TitleView)
        self._title = .constant("Login, Hoe")
        self._loginMsg = .constant(Text("This is a login message that can inform users etc.") as! LoginMsg)
    }
    
    public init(yourTitleView: Binding<TitleView>, authBool: Binding<Bool>) {
        self._authBool = authBool
        self._title = .constant("-x9@kfj")
        self._titleView = yourTitleView
        self._loginMsg = .constant(Text("") as! LoginMsg)
        
    }
    
    public init(yourTitleView: Binding<TitleView>, loginMsg: Binding<LoginMsg>,  authBool: Binding<Bool>) {
        self._authBool = authBool
        self._title = .constant("-x9@kfj")
        self._titleView = yourTitleView
        self._loginMsg = loginMsg
    }
    
    public init(data: LC_LoginViewData) {
        self._authBool = .constant(data.authBool)
        self._title = .constant(data.title)
        self._titleView = .constant(data.view as! TitleView)
        self._loginMsg = .constant(data.loginMsg as! LoginMsg)
    }
}

public struct LC_LoginViewData {
    var title: String
    var authBool: Bool
    var view: AnyView
    var loginMsg: AnyView
    
    public init(title: String = "Default Title struct", authBool: Bool = false, view: AnyView = AnyView(Text("Default Struct")), loginMsg: AnyView = AnyView(Text("This is a login message that can inform users etc.")) ) {
        self.title = title
        self.authBool = authBool
        self.view = view
        self.loginMsg = loginMsg
    }
}
