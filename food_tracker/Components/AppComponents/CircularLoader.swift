//
//  CircularLoader.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 07/01/26.
//

import UIKit

final class CircularLoader: UIView {
    
    static var defaultSize: CFloat = 50
    private let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    init(size: CGFloat = CGFloat(CircularLoader.defaultSize),
         backgroundDiminised: Bool = true) {

        super.init(frame: CGRect(origin: .zero,
                                 size: CGSize(width: size, height: size)))

        translatesAutoresizingMaskIntoConstraints = false
//        setupDimView(enabled: backgroundDiminised)
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
//        setupDimView(enabled: true)
        setupLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayer()
    }
    
    private func setupLayer() {
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.label.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = .round

        layer.addSublayer(shapeLayer)
        updatePath()
    }

    private func updatePath() {
        let radius = (bounds.width / 2) - 4
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: 1.5 * .pi, // partial arc looks better
            clockwise: true
        )

        shapeLayer.path = path.cgPath
    }
    
    func startAnimating() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = 1
        rotation.repeatCount = .infinity
        layer.add(rotation, forKey: "rotation")
    }
    
    func stopAnimating() {
        layer.removeAnimation(forKey: "rotation")
        removeFromSuperview()
    }
}
