//
//  DetailsViewController.swift
//  E-CommerceApp
//
//  Created by Aruuke Turgunbaeva on 29/1/24.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    var categoryDetails: CategoryList?
    
    private var imageCell = MakerView.shared.makeImage(cornerRadius: 0, imageName: "")
    
    private var titleLabel = MakerView.shared.makeLabel(textColor: UIColor.black, font: UIFont.systemFont(ofSize: 22, weight: .medium), text: "")
    
    private var itemLabel = MakerView.shared.makeLabel(textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 20, weight: .regular), text: "")
    
    private lazy var starStackView = MakerView.shared.makeStackView(axis: .horizontal, backgroundColor: UIColor.clear)
    
    private var priceLabel =  MakerView.shared.makeLabel(textColor: UIColor.blue, font: UIFont.systemFont(ofSize: 20, weight: .semibold), text: "")
    
    private var productDetailsLabel = MakerView.shared.makeLabel(textColor: UIColor.black, font: UIFont.systemFont(ofSize: 20, weight: .medium), text: "Product Details")
    
    private var stackView = MakerView.shared.makeStackView(axis: .vertical, backgroundColor: UIColor.clear)
    
    private lazy var roomLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Room Type")
    
    private lazy var colorLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Color")
    
    private lazy var materialLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Material")
    
    private lazy var dimensionsLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Dimensions    ")
    
    private lazy var weightLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Weight")
    
    private var rightStackView = MakerView.shared.makeStackView(axis: .vertical, backgroundColor: UIColor.clear)
    
    private lazy var officeLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Office, Living Room")
    
    private lazy var yellowLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Yellow")
    
    private lazy var textilLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Textile, Velvet, Cotton")
    
    private lazy var rightDimensionsLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "25.6 x 31.5 x 37.4 inches")
    
    private lazy var weighRightLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "20.3 Pounds")
    
    private lazy var buyButton = MakerView.shared.makeButton(setTitle: "Buy", for: .normal, backgroundColor: UIColor.link, tintColor: UIColor.white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        setupImage()
        setupTitleLabel()
        setupItemLabel()
        setupStarStackView()
        setupPriceLabel()
        setupViews()
        setupProduct()
        setupStackView()
        setupRightStackView()
        setupBuyBtn()
    }
    
    private func setupStarStackView() {
        view.addSubview(starStackView)
        starStackView.snp.makeConstraints { make in
            make.top.equalTo(itemLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        for _ in 0..<5 {
            let starImageView = MakerView.shared.makeImage(cornerRadius: 0, imageName: "star")
            starStackView.addArrangedSubview(starImageView)
        }
    }
    
    private func setupBuyBtn() {
        view.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(rightStackView.snp.bottom).offset(39)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    private func setupRightStackView() {
        view.addSubview(rightStackView)
        rightStackView.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalTo(stackView.snp.trailing).offset(18)
            make.height.equalTo(120)
        }
        
        rightStackView.addArrangedSubview(officeLabel)
        rightStackView.addArrangedSubview(yellowLabel)
        rightStackView.addArrangedSubview(textilLabel)
        rightStackView.addArrangedSubview(rightDimensionsLabel)
        rightStackView.addArrangedSubview(weighRightLabel)
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(120)
        }
        
        stackView.addArrangedSubview(roomLabel)
        stackView.addArrangedSubview(colorLabel)
        stackView.addArrangedSubview(materialLabel)
        stackView.addArrangedSubview(dimensionsLabel)
        stackView.addArrangedSubview(weightLabel)
    }
    
    private func setupProduct() {
        view.addSubview(productDetailsLabel)
        productDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
    }
    
    private func setupViews() {
        imageCell.image = UIImage(named: categoryDetails?.image ?? "")
        titleLabel.text = categoryDetails?.mainTitle ?? ""
        itemLabel.text = categoryDetails?.itemTitle ?? ""
        priceLabel.text = categoryDetails?.price ?? ""
    }
    
    private func setupImage() {
        view.addSubview(imageCell)
        imageCell.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCell.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().offset(16)
            make.height.equalTo(36)
        }
    }
    
    private func setupItemLabel() {
        view.addSubview(itemLabel)
        itemLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
    }
    
    private func setupPriceLabel() {
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(10)
            make.leading.equalTo(16)
            make.height.equalTo(30)
        }
    }
}



