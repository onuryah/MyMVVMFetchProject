//
//  PhotoViewModel.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 24.11.2021.
//

import Foundation

struct PhotoListViewModel{
    let photoList : [Photos]
    
    func numberOfRowsInSection() -> Int{
        return self.photoList.count
    }
    func photoAtIndex (_ index: Int) -> PhotoViewModel{
        let photos = self.photoList[index]
        return PhotoViewModel(photo: photos)
    }
}

struct PhotoViewModel{
    let photo : Photos
    var title : String{
        return self.photo.title
    }
    var id : Int{
        return self.photo.albumId
    }
    var thumbnailUrl : String{
        return self.photo.thumbnailUrl
    }
    var photoUrl : String{
        return self.photo.photoUrl
    }
}
