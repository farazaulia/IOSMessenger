//
//  Sender.swift
//  IOSMessenger
//
//  Created by Faraz Muhammad Aulia on 28/09/20.
//  Copyright © 2020 Faraz Muhammad Aulia. All rights reserved.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}
