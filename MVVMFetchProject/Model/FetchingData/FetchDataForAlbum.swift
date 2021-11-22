//
//  FetchDataForAlbum.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import Foundation

class FetchAlbum {
    private var albumArray = [Albums]()
    
    public func getData(completion : @escaping([Albums]?) -> ()) {
        URLSession.shared.dataTask(with: AlbumUrl().albumUrl!) { data, response, error in
                DispatchQueue.main.async {
                if error != nil {
                    completion(nil)
                }else if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String : Any]]{
                            for data in json {
                                if let titleToList = data["title"] as? String{
                                    if let idToList = data["id"] as? Int{
                                        let albumsId = Albums(id: idToList, title: titleToList)
                                        self.albumArray.append(albumsId)
                                        completion(self.albumArray)
                                }
                            }
                        }
                    }
                }
           }
        }.resume()
    }
}
