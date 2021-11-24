//
//  AlbumViewModel.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 24.11.2021.
//

import Foundation

struct AlbumListViewModel{
    let albumList : [Albums]
    
    func numberOfRowsInSection() -> Int{
        return self.albumList.count
    }
    func albumAtIndex (_ index: Int) -> AlbumViewModel{
        let albums = self.albumList[index]
        return AlbumViewModel(album: albums)
    }
}

struct AlbumViewModel{
    let album : Albums
    var title : String{
        return self.album.title
    }
    var id : Int{
        return self.album.id
    }
}
