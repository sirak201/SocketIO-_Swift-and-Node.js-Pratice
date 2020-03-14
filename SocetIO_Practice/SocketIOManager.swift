//
//  SocketIO.swift
//  SocetIO_Practice
//
//  Created by Sirak on 3/14/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import SocketIO
import Foundation


class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    let manager = SocketManager(socketURL: URL(string: "http://10.1.10.84:3000")!, config: [.log(true), .compress])
    let  socket : SocketIOClient!

    
    override init() {
        socket = manager.defaultSocket

        super.init()
    }
    

    func establishConnection() {
        
        //socket.connect()
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.connect()

    }
     
     
    func closeConnection() {
        socket.disconnect()
    }
 
    func connectToServerWithNickname(nickname: String, completionHandler: (_ userList: [[String: AnyObject]]) -> Void) {
        socket.emit("connectUser", nickname)
        
        socket.on("userList") { (data, act) in
            print(data[0])
        }

//        socket.emitAll("connectUser", withItems: [nickname])
//        socket.emit


   }
}
