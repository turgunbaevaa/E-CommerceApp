//
//  CustomTableViewCell.swift
//  E-CommerceApp
//
//  Created by Aruuke Turgunbaeva on 27/1/24.
//

import SnapKit

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let categoryCellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 20
        return cell
    }()
    
    private let itemAndCategoryStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let categoryImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "furniture")
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let numberOfItemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(hex: "#7F7F7F")
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(categoryCellView)
        categoryCellView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)//.offset(-2)
            make.height.equalTo(220)
        }
        
        categoryCellView.addSubview(categoryImage)
        categoryImage.snp.makeConstraints { make in
            make.top.equalTo(categoryCellView.snp.top)//.offset(12)
            make.horizontalEdges.equalToSuperview()
            make.height.width.equalTo(166)
        }
        
        categoryCellView.addSubview(itemAndCategoryStackView)
        itemAndCategoryStackView.snp.makeConstraints { make in
            make.top.equalTo(categoryImage.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.bottom.equalTo(categoryCellView.snp.bottom).offset(-5)
        }
        itemAndCategoryStackView.addArrangedSubview(categoryNameLabel)
        itemAndCategoryStackView.addArrangedSubview(numberOfItemLabel)
    }
    
    func setCategoryData(_ image: String, categoryName: String, numberOfItems: String){
        categoryImage.image = UIImage(named: image)
        categoryNameLabel.text = categoryName
        numberOfItemLabel.text = numberOfItems
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
