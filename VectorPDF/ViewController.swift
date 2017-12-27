//
//  ViewController.swift
//  VectorPDF
//
//  Created by Joseph Blau on 12/26/17.
//  Copyright © 2017 Joseph Blau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let sliderInset: CGFloat = 10
    private let imageDimension: CGFloat = 100
    
    private var multiplier = 1.0
    private var slider: UISlider = UISlider()
    private var vectorPdf: UIImageView = UIImageView(image: UIImage(named: "gdax"))
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vectorPdf.translatesAutoresizingMaskIntoConstraints = false
        vectorPdf.contentMode = .scaleAspectFit
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.1
        slider.maximumValue = 50.0
        slider.addTarget(self, action: #selector(updateSliderScale), for: UIControlEvents.valueChanged)
        
        view.addSubview(vectorPdf)
        view.addSubview(slider)
        
        configureViews()
    }
    
    private func configureViews() {
        vectorPdf.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vectorPdf.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthConstraint = vectorPdf.widthAnchor.constraint(equalToConstant: imageDimension)
        widthConstraint?.isActive = true
        heightConstraint = vectorPdf.heightAnchor.constraint(equalToConstant: imageDimension)
        heightConstraint?.isActive = true
        
        slider.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: sliderInset).isActive = true
        slider.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -sliderInset).isActive = true
        slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sliderInset).isActive = true
    }
    
    // MARK: - Delegates
    
    @objc func updateSliderScale() {
        widthConstraint?.constant = CGFloat(slider.value) * imageDimension
        heightConstraint?.constant = CGFloat(slider.value) * imageDimension
    }
}

