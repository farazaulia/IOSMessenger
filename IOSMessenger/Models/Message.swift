//
//  File.swift
//  IOSMessenger
//
//  Created by Faraz Muhammad Aulia on 28/09/20.
//  Copyright © 2020 Faraz Muhammad Aulia. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
