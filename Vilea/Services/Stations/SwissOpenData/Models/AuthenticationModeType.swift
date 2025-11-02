//
//  AuthenticationModeType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum AuthenticationModeType: String, Decodable {
    case NFC_RFID_Classic = "NFC RFID Classic"
    case NFC_RFID_DESFire = "NFC RFID DESFire"
    /// ISO/IEC 15118.
    case PnC
    /// App, QR-Code, Phone.
    case REMOTE
    /// Remote use via direct payment. E.g. intercharge direct
    case Direct_Payment = "Direct Payment"
    /// Not Authentication Method Required
    case No_Authentication_Required = "No Authentication Required"
}
