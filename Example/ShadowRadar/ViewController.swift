//
//  ViewController.swift
//  ShadowRadar
//
//  Created by Meng Li on 2019/02/19.
//  Copyright © 2018 XFLAG. All rights reserved.
//

import UIKit
import SnapKit
import ShadowRadar

class ViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "background.jpg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(frame: view.bounds)
        effectView.effect = UIBlurEffect(style: .dark)
        effectView.alpha = 0.8
        return effectView
    }()
    
    private lazy var radar: ShadowRadar = {
        let radar = ShadowRadar()
        radar.maxLevel = 4
        radar.addRadar(levels: [3, 2, 3, 4, 3, 1], color: UIColor(white: 1, alpha: 0.75))
        radar.addRadar(levels: [3, 4, 3, 3, 3, 2], color: UIColor(white: 0.5, alpha: 0.75))
        return radar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundImageView)
        view.addSubview(blurView)
        view.addSubview(radar)
        createConstraints()
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    private func createConstraints() {
        radar.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(radar.snp.width)
        }
    }
    
}

