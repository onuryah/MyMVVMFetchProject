//
//  Photos.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import Foundation

struct Photos {
    let title : String
    let albumId : Int
    let photoUrl : String
    let thumbnailUrl : String
    static var selectedPhotoUrl = String()
    static var selectedPhotoname = String()
}
