//
//  ClueButtonView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit
import SnapKit

protocol ClueButtonViewDelegate: AnyObject {
    func clueButtonView(didTapButton button: UIButton)
}

final class ClueButtonView: UIView {
    
    weak var delegate: ClueButtonViewDelegate?
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFill
        button.configuration?.title = ""
        
        return button
    }()

    // MARK: Init
    init(image: UIImage) {
        self.button.setBackgroundImage(image, for: .normal)
        super.init(frame: .zero)
        setViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setViews() {
        addSubview(button)
    }

    private func layoutViews() {
        button.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(didTapClueButton), for: .touchUpInside)
    }
    
    func changeButtonState(image: UIImage) {
        button.setBackgroundImage(image, for: .normal)
    }
}

extension ClueButtonView {
    @objc func didTapClueButton(_ sender: UIButton) {
        delegate?.clueButtonView(didTapButton: sender)
    }
}
