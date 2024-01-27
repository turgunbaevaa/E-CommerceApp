//
//  ShopController.swift
//  E-CommerceApp
//
//  Created by Aruuke Turgunbaeva on 27/1/24.
//

import UIKit
import SnapKit

class ShopController: UIViewController, UITableViewDataSource{
    
    private let categoryTableView = UITableView()
    
    private let categoryList: [CategoryList] = [
        CategoryList(image: "furniture", categoryName: "Furniture", numberOfItems: "785 Items"),
        CategoryList(image: "kitchen", categoryName: "Kitchenware", numberOfItems: "645 Items"),
        CategoryList(image: "table", categoryName: "Reading Tables", numberOfItems: "Inventory")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        setupContactTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setCategoryData(categoryList[indexPath.row].image,
                             categoryName: categoryList[indexPath.row].categoryName,
                             numberOfItems: categoryList[indexPath.row].numberOfItems)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
    
    
    
    private func setupContactTableView(){
        categoryTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        categoryTableView.dataSource = self
        view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)//.offset(20)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
}
