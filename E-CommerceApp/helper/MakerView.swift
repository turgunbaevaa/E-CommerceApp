//
//  MakerView.swift
//  E-CommerceApp
//
//  Created by Aruuke Turgunbaeva on 29/1/24.
//

import Foundation
import UIKit
import SnapKit

class MakerView {
    
    static let shared = MakerView()
    
    func makeStackView(axis: NSLayoutConstraint.Axis,
                        distribution: UIStackView.Distribution = .fillEqually,
                        clipsToBounds: Bool = true,
                        backgroundColor: UIColor) -> UIStackView {
        let view = UIStackView()
        view.axis = axis
        view.distribution = distribution
        view.clipsToBounds = clipsToBounds
        view.backgroundColor = backgroundColor
        return view
    }
    
    func makeButton(setTitle: String,
                    setImage: UIImage? = nil,
                    for state: UIControl.State,
                    backgroundColor: UIColor,
                    tintColor: UIColor,
                    cornerRadius: CGFloat = 10) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: state)
        button.setImage(setImage, for: .normal)
        button.backgroundColor = backgroundColor
        button.tintColor = tintColor
        button.layer.cornerRadius = cornerRadius
        return button
    }

    
    func makeLabel(textAlignment: NSTextAlignment = .left,
                    textColor: UIColor,
                    font: UIFont,
                    text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.font = font
        label.text = text
        return label
    }
    
    func makeImage(contentMode: UIView.ContentMode = .scaleAspectFill,
                    clipsToBounds: Bool = true,
                    cornerRadius: CGFloat,
                    imageName: String) -> UIImageView {
        let img = UIImageView()
        img.contentMode =  contentMode
        img.clipsToBounds = clipsToBounds
        img.layer.cornerRadius = cornerRadius
        img.image = UIImage(named: imageName)
        return img
    }
}
