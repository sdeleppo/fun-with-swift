//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Sarah Deleppo on 12/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Appreciate potatoes", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBrown,
        .systemTeal,
        .systemGreen,
        .systemPurple,
        .systemBlue,
        .systemYellow,
        .systemOrange,
        .systemMint
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink

        view.addSubview(imageView)
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        button.frame = CGRect(
            x: 100,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-200,
            height: 55
        )
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600/?potato"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

