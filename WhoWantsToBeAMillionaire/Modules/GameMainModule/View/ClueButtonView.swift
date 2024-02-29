//
//  ClueButtonView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit
import SnapKit

final class ClueButtonView: UIView {
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFill
        button.configuration?.title = ""
        
        return button
    }()

    // MARK: Init
    init(image: UIImage) {
        self.button.setImage(image, for: .normal)
        super.init(frame: .zero)
        setViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(selector: Selector) {
        button.addTarget(nil, action: selector, for: .touchUpInside)
    }
}

// MARK: - Setup Veiws
extension ClueButtonView {

    private func setViews() {
        addSubview(button)
    }

    private func layoutViews() {
        button.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(100)
        }
    }
}
