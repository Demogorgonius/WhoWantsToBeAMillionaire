//
//  ClueButtonView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by  Maksim Stogniy on 29.02.2024.
//

import UIKit
import SnapKit

protocol ClueButtonViewDelegate: AnyObject {
    func clueButtonView(didTapButton button: ClueUIButton, clue: ClueTypes)
}

final class ClueButtonView: UIView {
    
    weak var delegate: ClueButtonViewDelegate?
    
    private var button: ClueUIButton = {
        let button = ClueUIButton()
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFill
        button.configuration?.title = ""
        
        return button
    }()

    // MARK: Init
    init(_ clue: ClueTypes) {
        self.button.clue = clue
        self.button.setBackgroundImage(clue.image, for: .normal)
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
    
    func disable() {
        button.isEnabled = false
    }
}

extension ClueButtonView {
    @objc func didTapClueButton(_ sender: ClueUIButton) {
        delegate?.clueButtonView(didTapButton: sender, clue: sender.clue ?? ClueTypes.fifty
        )
    }
}
