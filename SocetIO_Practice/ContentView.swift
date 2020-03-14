//
//  ContentView.swift
//  SocetIO_Practice
//
//  Created by Sirak on 3/14/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action : {
            SocketIOManager.sharedInstance.connectToServerWithNickname(nickname: "Sirak") { (_) in
//                print(data)
            }
        } ) {
            Text("Sent Emit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
