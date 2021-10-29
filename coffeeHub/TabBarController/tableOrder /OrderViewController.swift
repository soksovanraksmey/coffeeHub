//
//  OrderViewController.swift
//  coffeeHub
//
//  Created by zed on 10/22/21.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var menuList:[Getmenu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
//        navigationItem.rightBarButtonItem =
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menu))
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.lightGray
        
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        getmenuList()
    }
    
    
    @objc func menu(){
        
    }
    
   @objc func search(){
        
    }
    
    func getmenuList(){
        
        let url = URL(string: "https://coffeetek.herokuapp.com/menu")
        let urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "GET"
        do{
            URLSession.shared.dataTask(with: urlRequest) { (data, respone, error) in
                if let respone = respone as? HTTPURLResponse{
                    print("status code : \(respone.statusCode)")
                }
                
                if let data = data{
                    do{
                    let menus = try JSONDecoder().decode([Getmenu].self, from: data)
                    print(menus)
                        self.menuList = menus
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                       
                    }catch{
                        
                    }
                }
                
            }.resume()
 
        }catch{
            print(error.localizedDescription)
        }
       
    }

 
}
// for get image from API url
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension OrderViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        
        let getModel = menuList[indexPath.row]
        print(getModel)
    
        cell.nameCofe.text = getModel.name
        cell.imageCofe.load(url: URL(string: getModel.image)!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController
        
        let pushModel = menuList[indexPath.row]
        vc?.listData = pushModel
//        print(pushModel)
        vc?.navigationNameBar = pushModel.name

        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
  
}



struct Getmenu:Codable{
    let _id: String
    let name: String
    let image: String
    let price: Double
    let status:Int
//    let __v: Int
}
