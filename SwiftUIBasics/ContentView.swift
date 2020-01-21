//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by LPT 528 on 1/15/20.
//  Copyright © 2020 Godoh Dev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertVisible: Bool = false
    @State var email: String = ""
    
    struct ButtonGradientStyle : ViewModifier{
        func body(content: Content) -> some View {
            return content
            .frame(minWidth:0, maxWidth: .infinity)
            .padding(.vertical,12)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
            .accentColor(Color.white)
            .cornerRadius(8.0)
        }
    }
    
    var body: some View {
        VStack {
            Text("Login Account")
                .font(.title)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.horizontal) .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.horizontal) .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Forgot Password ?")
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("DarkBlue"))
                .frame(maxWidth:.infinity, alignment: .trailing)
                .padding(.trailing)
                
            
            Button(action:{
                self.isAlertVisible = true
            }){
                Text("Login")
            }
            .modifier(ButtonGradientStyle())
            .padding(.horizontal)
            .padding(.top,32.0)
            
            HStack{
                Text("Don't have an Account?")
                    .font(.caption)
                    .fontWeight(.thin)
                
                Text("Sign Up")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color("DarkBlue"))
                
            }.padding(.top,8)
        }
        .alert(isPresented: $isAlertVisible){
            () -> Alert in return Alert(title: Text("Welcome!"), message: Text("Hello \(email)!"), dismissButton: .default(Text("back")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
