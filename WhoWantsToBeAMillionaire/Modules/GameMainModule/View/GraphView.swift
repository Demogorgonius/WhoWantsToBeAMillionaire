//
//  GraphView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 03.03.2024.
//

import Foundation
import UIKit
import SnapKit



class GraphView: CustomView {
    
    var graphData: [Int]?
    let view = GraphView.self

    
    init(with garaphData: [Int]) {
        self.graphData = garaphData
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var graphViewOne: UIView = {
        let view = GraphViewFactory.createGraphView().shadowGraphView
        return view
    }()
    
    lazy var graphViewTTwo: UIView = {
        let view = GraphViewFactory.createGraphView().shadowGraphView
        return view
    }()
    
    lazy var graphViewThree: UIView = {
        let view = GraphViewFactory.createGraphView().shadowGraphView
        return view
    }()
    
    lazy var graphViewFour: UIView = {
        let view = GraphViewFactory.createGraphView().shadowGraphView
        return view
    }()
    
    
    
    
    override func setViews() {
        super.setViews()
    
        [graphViewOne, graphViewTTwo, graphViewThree, graphViewFour].forEach { addSubview($0) }
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        self.backgroundColor = .systemGray
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.9
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.alpha = 0.7
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let viewXPosition = UIScreen.main.bounds.width/2
        let viewYPosition = UIScreen.main.bounds.height/2
        self.frame = CGRect(
            x: viewXPosition - 150,
            y: viewYPosition - 250,
            width: 300,
            height: 500
        )
       
        var xPosition = self.bounds.minX + 25
        let yPosition = self.bounds.minY + 50
        
        for (index, graph) in [graphViewOne, graphViewTTwo, graphViewThree, graphViewFour].enumerated() {
            graph.frame = CGRect(x: xPosition, y: yPosition + (450 - getHieght(graphData![index]) - 50), width: 50, height: getHieght(graphData![index]))
            
            let label = LabelFactory.createShadowLabel().shadowLabel
            label.text = GraphViewFactory().getSignature(index)
            label.frame = CGRect(x: xPosition + 15, y: yPosition + 415, width: 20, height: 20)
            addSubview(label)
            xPosition += graphViewOne.bounds.width + 20
        }
        
        
        
    }
    
    
    private func getHieght(_ int: Int) -> CGFloat {
       return 450 * CGFloat(int) / 100
    }
    
    private func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        return stackView
    }
    
}

extension GraphView {
   
}
