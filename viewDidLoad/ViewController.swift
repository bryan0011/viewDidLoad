//
//  ViewController.swift
//  viewDidLoad
//
//  Created by Bryan Kuo on 2021/7/8.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let player = AVPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0, 1]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
//        太陽雨
        let sunEmitter = CAEmitterCell()
        sunEmitter.contents = UIImage(named: "sun")?.cgImage
        sunEmitter.birthRate = 50
        sunEmitter.lifetime = 20
        sunEmitter.lifetimeRange = 5
        sunEmitter.velocity = -40
        sunEmitter.velocityRange = -20
        sunEmitter.scale = 0.05
        sunEmitter.scaleRange = 0.05
        sunEmitter.scaleSpeed = -0.01
        sunEmitter.xAcceleration = 5
        sunEmitter.yAcceleration = 50
        sunEmitter.spin = 0.5
        sunEmitter.spinRange = 1
        sunEmitter.emissionRange = CGFloat.pi
        let sunEmitterLayer = CAEmitterLayer()
        sunEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        sunEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        sunEmitterLayer.emitterShape = .line
        sunEmitterLayer.emitterCells = [sunEmitter]
        view.layer.addSublayer(sunEmitterLayer)
        
//        播放背景音樂
        let fileUrl = Bundle.main.url(forResource: "faded", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playItem)
        player.volume = 0.5
        player.play()
        
        
    }


}

