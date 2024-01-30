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
    
    private var mainImg = MakerView.shared.makeImage(cornerRadius: 0, imageName: "")
    
    private var titleLabel = MakerView.shared.makeLabel(textColor: UIColor.black, font: UIFont.systemFont(ofSize: 22, weight: .medium), text: "")
    
    private var itemLabel = MakerView.shared.makeLabel(textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 20, weight: .regular), text: "")
    
    private lazy var starStackView = MakerView.shared.makeStackView(axis: .horizontal, backgroundColor: UIColor.clear)
    
    private var priceLabel =  MakerView.shared.makeLabel(textColor: UIColor.blue, font: UIFont.systemFont(ofSize: 20, weight: .semibold), text: "")
    
    private var productDetailsLabel = MakerView.shared.makeLabel(textColor: UIColor.black, font: UIFont.systemFont(ofSize: 20, weight: .medium), text: "Product Details")
    
    private var labelsStackView = MakerView.shared.makeStackView(axis: .vertical, backgroundColor: UIColor.clear)
    
    private lazy var roomLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Room Type")
    
    private lazy var colorLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Color")
    
    private lazy var materialLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Material")
    
    private lazy var dimensionsLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Dimensions    ")
    
    private lazy var weightLabel = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Weight")
    
    private var titlesStackView = MakerView.shared.makeStackView(axis: .vertical, backgroundColor: UIColor.clear)
    
    private lazy var roomsTitle = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Office, Living Room")
    
    private lazy var colorsTitle = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Yellow")
    
    private lazy var materialsTitle = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "Textile, Velvet, Cotton")
    
    private lazy var dimensionsTitle = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "25.6 x 31.5 x 37.4 inches")
    
    private lazy var weightsTitle = MakerView.shared.makeLabel(textColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "20.3 Pounds")
    
    private lazy var buyButton = MakerView.shared.makeButton(setTitle: "Buy", for: .normal, backgroundColor: UIColor.link, tintColor: UIColor.white)
    
    private lazy var numberOfItemsStackView = MakerView.shared.makeStackView(axis: .horizontal, backgroundColor: UIColor.white)
    
    private lazy var plusItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var itemCount = 1
    
    private lazy var itemCountLabel: UILabel = {
        let label = MakerView.shared.makeLabel(textColor: UIColor.black, font: UIFont.systemFont(ofSize: 15, weight: .regular), text: "\(itemCount)")
        return label
    }()
    
    private lazy var minusItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
        setupNumberOfItemsStackView()
        setupProductDetailsLabel()
        setupLabelsStackView()
        setupTitlesStackView()
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
            make.top.equalTo(titlesStackView.snp.bottom).offset(39)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    private func setupTitlesStackView() {
        view.addSubview(titlesStackView)
        titlesStackView.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalTo(labelsStackView.snp.trailing).offset(18)
            make.height.equalTo(120)
        }
        
        titlesStackView.addArrangedSubview(roomsTitle)
        titlesStackView.addArrangedSubview(colorsTitle)
        titlesStackView.addArrangedSubview(materialsTitle)
        titlesStackView.addArrangedSubview(dimensionsTitle)
        titlesStackView.addArrangedSubview(weightsTitle)
    }
    
    private func setupLabelsStackView() {
        view.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { make in
            make.top.equalTo(productDetailsLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(120)
        }
        
        labelsStackView.addArrangedSubview(roomLabel)
        labelsStackView.addArrangedSubview(colorLabel)
        labelsStackView.addArrangedSubview(materialLabel)
        labelsStackView.addArrangedSubview(dimensionsLabel)
        labelsStackView.addArrangedSubview(weightLabel)
    }
    
    private func setupProductDetailsLabel() {
        view.addSubview(productDetailsLabel)
        productDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
    }
    
    private func setupViews() {
        mainImg.image = UIImage(named: categoryDetails?.image ?? "")
        titleLabel.text = categoryDetails?.mainTitle ?? ""
        itemLabel.text = categoryDetails?.itemTitle ?? ""
        priceLabel.text = categoryDetails?.price ?? ""
    }
    
    private func setupImage() {
        view.addSubview(mainImg)
        mainImg.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(370)
        }
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImg.snp.bottom).offset(10)
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
    
    private func setupNumberOfItemsStackView() {
        view.addSubview(numberOfItemsStackView)
        numberOfItemsStackView.distribution = .fillEqually  // Set distribution to fill equally
        numberOfItemsStackView.spacing = 3
        
        numberOfItemsStackView.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        let buttonWidth = 40
        minusItemButton.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
        }
        itemCountLabel.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
        }
        
        numberOfItemsStackView.addArrangedSubview(minusItemButton)
        numberOfItemsStackView.addArrangedSubview(itemCountLabel)
        numberOfItemsStackView.addArrangedSubview(plusItemButton)
        
        plusItemButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusItemButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    }

    @objc private func plusButtonTapped() {
        itemCount += 1
        itemCountLabel.text = "\(itemCount)"
    }
    
    @objc private func minusButtonTapped() {
        if itemCount == 1 {
            return
        } else {
            itemCount -= 1
            itemCountLabel.text = "\(itemCount)"
        }
    }
}



