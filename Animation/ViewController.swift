//
//  ViewController.swift
//  Animation
//
//  Created by Sean on 2018/12/17.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var emitterArr = [CAEmitterCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通过CAEmitterLayer可以很原生的创造微粒效果,不需要第三方库
        let emitter = CAEmitterLayer()
        let rect = CGRect(x: 0.0, y: -100.0, width: view.bounds.width, height: view.bounds.height+100)
        //        let rect = view.bounds
        emitter.backgroundColor = UIColor.black.cgColor
        emitter.frame = rect
        view.layer.addSublayer(emitter)
        
        // kCAEmitterLayerPoint 将所有的粒子集中在position的位置,可用来做火花爆炸效果
        // kCAEmitterLayerLine 所有的粒子位于一条线上,可用来作瀑布效果
        // kCAEmitterLayerRectangle 所有粒子随机出现在所给定的矩形框内
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterPosition = CGPoint(x: rect.width/2, y: 0)
        emitter.emitterSize = rect.size
        
        
        for i in 1...11 {
            snow(imgStr: "Fireworks_\(i)")
        }
        
        // emitter可以添加很多不同类型的cell
        emitter.emitterCells = emitterArr
        
    }


    func snow(imgStr:String) {
        
        // 一个cell代表一个微粒
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: imgStr)!.cgImage
        
        // 每秒创建的cell
        emitterCell.birthRate = Float(arc4random()%5 + 10)
        // cell的生命周期为1.5秒
        emitterCell.lifetime = Float(arc4random()%4 + 2)
        
        // 制造一个y轴的加速度 70
        emitterCell.yAcceleration = CGFloat(arc4random()%50 + 100)
        
        //        emitterCell.velocity = 20.0
        // 给微粒设置一个发射角度
        emitterCell.emissionLongitude = CGFloat(-Double.pi)
        //        emitterCell.scale = 0.8
        
        
        
        // 添加随机的速度,如果有velocity,那么范围为 -180 ~ 220
        emitterCell.velocityRange = CGFloat(arc4random()%80 + 90)
        emitterCell.emissionRange = CGFloat(Double.pi / 2)
        
        emitterCell.lifetimeRange = 18
        
        //        emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
        // 值为0.3 的范围为 0.7~1.3,但由于高于1算1,所以值得范围为 0.7~1
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3
        // 随机大小
        emitterCell.scaleRange = 0.8
        // 每秒缩小15%
        emitterCell.scaleSpeed = -0.05
        
        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
        
        emitterArr.append(emitterCell)
    }

    
}

