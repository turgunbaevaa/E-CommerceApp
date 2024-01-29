//
//  ShopController.swift
//  E-CommerceApp
//
//  Created by Aruuke Turgunbaeva on 27/1/24.
//

import UIKit
import SnapKit

class ShopController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private let categoryTableView = UITableView()
    
//    private let categoryList: [CategoryList] = [
//        CategoryList(image: "furniture", categoryName: "Furniture", numberOfItems: "785 Items", priceType: "$", price: 230),
//        CategoryList(image: "kitchen", categoryName: "Kitchenware", numberOfItems: "645 Items", priceType: "$", price: 170),
//        CategoryList(image: "table", categoryName: "Reading Tables", numberOfItems: "Inventory", priceType: "$", price: 130)]
    
    private let categoryList: [CategoryList] = [
        CategoryList(image: "furniture", mainTitle: "Furniture", itemTitle: "785 Items", price: "$230"),
        CategoryList(image: "kitchen", mainTitle: "Kitchenware", itemTitle: "645 Items", price: "$130"),
        CategoryList(image: "table", mainTitle: "Reading Tables", itemTitle: "Inventory", price: "$170")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.backgroundColor = .white
        categoryTableView.dataSource = self
        categoryTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        categoryTableView.delegate = self
        
        setupContactTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setCategoryData(categoryList[indexPath.row].image,
                             categoryName: categoryList[indexPath.row].mainTitle,
                             numberOfItems: categoryList[indexPath.row].itemTitle)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }

    private func setupContactTableView(){
        categoryTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)//.offset(20)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = DetailsViewController()
            vc.categoryDetails = categoryList[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    
}



