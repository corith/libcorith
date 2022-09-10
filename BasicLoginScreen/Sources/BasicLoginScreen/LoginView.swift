//
//  SwiftUIView.swift
//  
//
//  Created by Cory Sebastian on 9/9/22.
//

import SwiftUI

struct LoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @Binding var title: String
    @Binding var hasAccess: Bool
    @Binding var customUserTitle: AnyView
    
    var body: some View {
        VStack {
            if title == "-x9@kfj" {
                AnyView(customUserTitle)
                    .padding(.top)
            } else {
                Text("\(title)")
                    .font(Font.custom("Chalkduster", size: 50))                    
            }
            Spacer()
            createLoginFields()
            Spacer()
//            createLoginButton()
            Text("* This is a login messgae. This can tell the user what to do if they don't have creds yet, info, etc. *")
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
                
//            Spacer()
            VStack {

                if #available(macOS 12.0, *) {
                    TextField("username", text: $userName)
                        .padding(7)
                        .foregroundColor(.red)
                        .textFieldStyle(.roundedBorder)
                        .background(.teal)
                        .cornerRadius(15)
                    SecureField("password", text: $password)
                        .padding(7)
                        .foregroundColor(.gray)
                        .textFieldStyle(.roundedBorder)
                        .background(.yellow)
                        .cornerRadius(15)
                    createLoginButton()
                } else {
                    // Fallback on earlier versions
                    Text("NOT COMPATIBLE....")
                }


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


