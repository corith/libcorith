//
//  SwiftUIView.swift
//  
//
//  Created by Cory Sebastian on 9/9/22.
//

import SwiftUI

struct LoginView<TitleView: View, LoginMsg: View>: View {
    @State private var userName: String = ""
    @State private var password: String = ""

    @Binding var title: String
    @Binding var hasAccess: Bool
    @Binding var titleView: TitleView
    @Binding var loginMsg: LoginMsg
    @Binding var userNColor: Color
    @Binding var pwdColor: Color
    
    var body: some View {
        VStack {
            if title == "-x9@kfj" {
                titleView
                    .padding(.top)
            } else {
                Text("\(title)")
                    .font(Font.custom("Chalkduster", size: 50))                    
            }
            Spacer()
            createLoginFields()
            Spacer()
//            createLoginButton()
            loginMsg
                .padding()
                .padding(.top)
            Spacer()
        }
    }
    
    func createLoginFields() -> some View {
        HStack(spacing: 10) {
            
            Image("red_ball", bundle: Bundle.module)
                .resizable()
                .scaledToFit()
                

            VStack {
                TextField("username", text: $userName)
                    .userNameStyle(color: userNColor)
                SecureField("password", text: $password)
                    .userPwdStyle(color: pwdColor)
                createLoginButton()

            }
            .frame(maxWidth: 300)
        }.padding([.leading,.trailing], 7)
    }
    
    @ViewBuilder
    func createLoginButton() -> some View {
        if #available(macOS 12.0, *) {
            Button(action: {
                print("login")
                if userName.lowercased() == "cory" && password.lowercased() == "con" {
                    hasAccess = true
                }
                hasAccess = true
            }, label: {
                Text("Login")
                    .foregroundColor(.white)
                    .bold()
                    .bold()
            })
            .frame(maxWidth: .infinity)
            .padding(11)
            .background(.indigo)
            .cornerRadius(15)
        } else {
            Text("Supposedly you cannot login because your OS is inferior...Yikes")
        }
    }
}

extension TextField {
    
    func userNameStyle(color: Color) -> some View {
        
        return self
            .padding(7)
            .foregroundColor(.red)
            .textFieldStyle(.roundedBorder)
            .background(color)
            .cornerRadius(15)
    }
}

extension SecureField {
    func userPwdStyle(color: Color) -> some View {
        
        return self
            .padding(7)
            .foregroundColor(.gray)
            .textFieldStyle(.roundedBorder)
            .background(color)
            .cornerRadius(15)
    }
    
}
