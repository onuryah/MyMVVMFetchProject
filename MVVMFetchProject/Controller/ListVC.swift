//
//  ViewController.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var albumNamesTableView: UITableView!
    private var albumArray : AlbumListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setTableViewDelegates()
        registerCellToTableView()
    }
    fileprivate func fetchData(){
        FetchAlbum().getData { album in
            if let album = album {
                self.albumArray = AlbumListViewModel(albumList: album)
            }else{
                self.makeAlert()
            }
            self.albumNamesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumArray == nil ? 0 : self.albumArray.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumNamesTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        cell.albumNamesLabelField.text = self.albumArray.albumAtIndex(indexPath.row).title.capitalizingFirstLetter()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Albums.selectedId = self.albumArray.albumAtIndex(indexPath.row).id
        performSegue(withIdentifier: "toAlbumDetailsVC", sender: nil)
    }

}
extension ListVC: UITableViewDelegate, UITableViewDataSource{
    fileprivate func setTableViewDelegates() {
        albumNamesTableView.delegate = self
        albumNamesTableView.dataSource = self
    }
    fileprivate func registerCellToTableView(){
        let cellNib = UINib(nibName: "ListCell", bundle: nil)
        albumNamesTableView.register(cellNib, forCellReuseIdentifier: "listCell")
    }
    
    func makeAlert(){
        let alert = UIAlertController(title: "ERROR", message: "Error Found!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

