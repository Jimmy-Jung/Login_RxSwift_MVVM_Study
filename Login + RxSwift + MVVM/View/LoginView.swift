//
//  LoginView.swift
//  Login + RxSwift + MVVM
//
//  Created by 정준영 on 2023/07/04.
//

import UIKit
import SnapKit
import Then

final class LoginView: UIView {
    private let textViewHeight: CGFloat = DV.TextSize.loginTextViewHeight
    
    // MARK: - UI요소
    
    lazy var logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: DV.ImageName.appLogo)
    }
    
    lazy var emailTextField = UITextField().then {
        $0.backgroundColor = .clear
        $0.textColor = .kakaoBrown
        $0.tintColor = .kakaoBrown
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.keyboardType = .emailAddress
    }
    
    lazy var emailTextFieldView = UIView().then {
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addSubview(emailInfoLabel)
        $0.addSubview(emailTextField)
    }
    
    lazy var emailInfoLabel = UILabel().then {
        $0.text = DV.LabelText.emailInfoLabel
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .kakaoLightBrown
    }
    
    lazy var passwordTextField = UITextField().then {
        $0.backgroundColor = .clear
        $0.textColor = .kakaoBrown
        $0.tintColor = .kakaoBrown
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.isSecureTextEntry = true
        $0.clearsOnBeginEditing = false
    }
    
    lazy var passwordTextFieldView = UIView().then {
        $0.backgroundColor = .systemBackground
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addSubview(passwordTextField)
        $0.addSubview(passwordInfoLabel)
        $0.addSubview(passwordSecureButton)
    }
    
    lazy var passwordInfoLabel = UILabel().then {
        $0.text = DV.LabelText.passwordInfoLabel
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .kakaoLightBrown
    }
    
    lazy var passwordSecureButton = UIButton().then {
        $0.setTitle(DV.LabelText.passwordSecureButton, for: .normal)
        $0.setTitleColor(UIColor.kakaoLightBrown, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    lazy var loginButton = UIButton().then {
        $0.backgroundColor = .kakaoLightBrown
        $0.layer.cornerRadius = 5
        $0.setTitle(DV.LabelText.loginButton, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.kakaoTextBrown, for: .disabled)
        $0.isEnabled = false
    }
    
    lazy var joinButton = UIButton().then {
        $0.backgroundColor = .kakaoLightBrown
        $0.layer.cornerRadius = 5
        $0.setTitle(DV.LabelText.joinButton, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.kakaoTextBrown, for: .disabled)
        $0.isEnabled = false
    }
    
    lazy var stackView = UIStackView().then {
        $0.spacing = 18
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.addArrangedSubview(emailTextFieldView)
        $0.addArrangedSubview(passwordTextFieldView)
        $0.addArrangedSubview(loginButton)
        $0.addArrangedSubview(joinButton)
    }
    
    lazy var passwordResetButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setTitle(DV.LabelText.passwordResetButton, for: .normal)
        $0.setTitleColor(.kakaoBrown, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    // MARK: - 이니셜라이저
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI요소 설정
    
    private func setup() {
        self.backgroundColor = .kakaoYellow
        [logoImageView, stackView, passwordResetButton].forEach { self.addSubview($0) }
    }
    
    // MARK: - 오토레이아웃 설정
    
    private func setupAutoLayout() {
        logoImageView.snp.makeConstraints {
            $0.width.equalTo(textViewHeight * 4)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top).offset(-20)
        }
        
        emailInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(emailTextFieldView).offset(8)
            $0.trailing.equalTo(emailTextFieldView).offset(-8)
            $0.centerY.equalTo(emailTextFieldView)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView).offset(15)
            $0.bottom.equalTo(emailTextFieldView).offset(-2)
            $0.leading.equalTo(emailTextFieldView).offset(8)
            $0.trailing.equalTo(emailTextFieldView).offset(-8)
        }
        
        passwordInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(passwordTextFieldView).offset(8)
            $0.trailing.equalTo(passwordTextFieldView).offset(-8)
            $0.centerY.equalTo(passwordTextFieldView)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView).offset(15)
            $0.bottom.equalTo(passwordTextFieldView).offset(-2)
            $0.leading.equalTo(passwordTextFieldView).offset(8)
            $0.trailing.equalTo(passwordSecureButton.snp.leading).offset(-8)
        }
        
        passwordSecureButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView).offset(15)
            $0.bottom.equalTo(passwordTextFieldView).offset(-15)
            $0.trailing.equalTo(passwordTextFieldView).offset(-8)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(textViewHeight * 4 + 36)
        }
        
        passwordResetButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(textViewHeight)
        }
    }
}