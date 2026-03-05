//
//  SignUpViewController.swift
//  GourmetBrew
//
//  Created by admin on 26/02/26.
//

import UIKit
import DesignSystem

final class SignUpViewController: UIViewController {
    
    // MARK: - Background
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = DSColors.textPrimary
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Image
    private let coffeeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "SignUpImage")
        iv.backgroundColor = DSColors.backgroundSecondary
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Nav bar
    private let backButton: UIButton = {
        let b = UIButton(type: .system)
        let image = UIImage(named: "ArrowButton")
        b.setImage(image, for: .normal)
        b.tintColor = DSColors.textSecondary
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return b
    }()
    
    private let navTitleLabel: DSLabel = {
        let l = DSLabel(fontSize: .subtitle, fontWeight: .semibold, color: DSColors.textSecondary)
        l.text = "Criar Conta"
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    // MARK: - Textos
    private let titleLabel: DSLabel = {
        let l = DSLabel(fontSize: .largeTitle, fontWeight: .bold, color: DSColors.textSecondary)
        l.text = "Bem-vindo ao Clube\nGourmet"
        l.numberOfLines = 0
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
        
    
    private let subtitleLabel: DSLabel = {
        let l = DSLabel(fontSize: .body, fontWeight: .regular, color: DSColors.textSecondary)
        l.text = "Junte-se à nossa comunidade exclusiva e\nsaboreie benefícios especiais a cada xícara."
        l.numberOfLines = 0
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    // MARK: - Campos
    private let nameLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .medium, color: DSColors.textSecondary)
        l.text = "Nome Completo"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let nameTextField: DSTextField = {
        let tf = DSTextField()
        tf.placeholder = "Ex: João Silva"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let emailLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .medium, color: DSColors.textSecondary)
        l.text = "E-mail"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let emailTextField: DSTextField = {
        let tf = DSTextField()
        tf.placeholder = "seu@email.com"
        tf.textField.keyboardType = .emailAddress
        tf.textField.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let pwdLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .medium, color: DSColors.textSecondary)
        l.text = "Senha"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let pwdTextField: DSTextField = {
        let tf = DSTextField()
        tf.placeholder = "••••••••"
        tf.textField.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let confirmPwdLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .medium, color: DSColors.textSecondary)
        l.text = "Confirmar Senha"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let confirmPwdTextField: DSTextField = {
        let tf = DSTextField()
        tf.placeholder = "••••••••"
        tf.textField.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // MARK: - Termos
    private let termosCheckbox: UIButton = {
        let b = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        b.setImage(UIImage(systemName: "square", withConfiguration: config), for: .normal)
        b.setImage(UIImage(systemName: "checkmark.square.fill", withConfiguration: config), for: .selected)
        b.tintColor = DSColors.brandPrimary
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    private let termosLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .regular, color: DSColors.textSecondary)
        let text = "Eu aceito os Termos de Uso e a Política de Privacidade."
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttribute(.foregroundColor, value: DSColors.brandPrimary, range: (text as NSString).range(of: "Termos de Uso"))
        attributed.addAttribute(.foregroundColor, value: DSColors.brandPrimary, range: (text as NSString).range(of: "Política de Privacidade"))
        l.attributedText = attributed
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    // MARK: - Botão + link
    private lazy var SighUpButton: DSButton = {
        let b = DSButton(variant: .primary, size: .large)
        b.setTitle("Cadastrar", for: .normal)
        b.addTarget(self, action: #selector(cadastrarTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    private let loginLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .regular, color: DSColors.textSecondary)
        l.textAlignment = .center
        let text = "Já possui uma conta? Faça Login"
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttribute(.foregroundColor, value: DSColors.brandPrimary, range: (text as NSString).range(of: "Faça Login"))
        l.attributedText = attributed
        l.isUserInteractionEnabled = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    // MARK: - ScrollView
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let scrollContent: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = DSColors.backgroundPrimary
        setupHierarchy()
        setupConstraints()
        bindViewModel()
        termosCheckbox.addTarget(self, action: #selector(toggleTermos), for: .touchUpInside)
        addPasswordToggle(to: pwdTextField, action: #selector(toggleSenha))
        addPasswordToggle(to: confirmPwdTextField, action: #selector(toggleConfirmarSenha))
        pwdTextField.textField.addTarget(self, action: #selector(validatePassword), for: [.editingChanged, .editingDidEnd])
        confirmPwdTextField.textField.addTarget(self, action: #selector(validatePassword), for: [.editingChanged, .editingDidEnd])
        SighUpButton.isEnabled = false
        SighUpButton.alpha = 0.5
    }
    
    // MARK: - Setup
    private func setupHierarchy() {
        // fundo
        view.addSubview(backgroundImageView)
        
        // nav fixo (não scrolla)
        view.addSubview(backButton)
        view.addSubview(navTitleLabel)
        
        // scroll
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        
        scrollContent.addSubviews(
            coffeeImageView,
            titleLabel,
            subtitleLabel,
            nameLabel, nameTextField,
            emailLabel, emailTextField,
            pwdLabel, pwdTextField,
            confirmPwdLabel, confirmPwdTextField,
            termosCheckbox, termosLabel,
            SighUpButton,
            loginLabel
        )
    }
    
    private func addPasswordToggle(to dsTextField: DSTextField, action: Selector) {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
        button.setImage(UIImage(systemName: "eye", withConfiguration: config), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash", withConfiguration: config), for: .selected)
        button.tintColor = DSColors.textSecondary
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: action, for: .touchUpInside)
        
        dsTextField.textField.rightView = button
        dsTextField.textField.rightViewMode = .always
    }
    
    private func setupConstraints() {
        let padding = DSSpacing.sm
        
        NSLayoutConstraint.activate([
            // Background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Nav — fixo no topo, fora do scroll
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DSSpacing.xs),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36),
            
            navTitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            navTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // ScrollView — começa abaixo do nav
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: DSSpacing.xs),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ScrollContent
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Coffee Image
            coffeeImageView.topAnchor.constraint(equalTo: scrollContent.topAnchor),
            coffeeImageView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor),
            coffeeImageView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor),
            coffeeImageView.heightAnchor.constraint(equalToConstant: 260),
            
            // Título
            titleLabel.topAnchor.constraint(equalTo: coffeeImageView.bottomAnchor, constant: DSSpacing.md),
            titleLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -padding),
            
            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DSSpacing.xxs),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Nome
            nameLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DSSpacing.md),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: DSSpacing.xxs),
            nameTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Email
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: DSSpacing.sm),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: DSSpacing.xxs),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Senha
            pwdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: DSSpacing.sm),
            pwdLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: DSSpacing.xxs),
            pwdTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            pwdTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Confirmar Senha
            confirmPwdLabel.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: DSSpacing.sm),
            confirmPwdLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            confirmPwdTextField.topAnchor.constraint(equalTo: confirmPwdLabel.bottomAnchor, constant: DSSpacing.xxs),
            confirmPwdTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            confirmPwdTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Termos
            termosCheckbox.topAnchor.constraint(equalTo: confirmPwdTextField.bottomAnchor, constant: DSSpacing.sm),
            termosCheckbox.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            termosCheckbox.widthAnchor.constraint(equalToConstant: 24),
            termosCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            termosLabel.centerYAnchor.constraint(equalTo: termosCheckbox.centerYAnchor),
            termosLabel.leadingAnchor.constraint(equalTo: termosCheckbox.trailingAnchor, constant: DSSpacing.xxs),
            termosLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Botão Cadastrar
            SighUpButton.topAnchor.constraint(equalTo: termosCheckbox.bottomAnchor, constant: DSSpacing.md),
            SighUpButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            SighUpButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Login link
            loginLabel.topAnchor.constraint(equalTo: SighUpButton.bottomAnchor, constant: DSSpacing.sm),
            loginLabel.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -DSSpacing.lg),
        ])
    }
    
    //MARK: - Binding
    private func bindViewModel() {
        viewModel.onValidationError = { [weak self] message in
            self?.showAlert(message: message)
        }
        viewModel.onButtonState = { [weak self] isEnabled in
            self?.handleSignUpButton(isEnabled: isEnabled)
        }
    }
    
    //MARK: - Variables
    let viewModel = SignUpViewModel()
    
    // MARK: - Actions
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func toggleTermos() {
        termosCheckbox.isSelected.toggle()
    }
    
    @objc private func cadastrarTapped() {
        
    }
    
    @objc private func toggleSenha() {
        let button = pwdTextField.textField.rightView as? UIButton
        button?.isSelected.toggle()
        pwdTextField.textField.isSecureTextEntry.toggle()
    }
    
    @objc private func toggleConfirmarSenha() {
        let button = confirmPwdTextField.textField.rightView as? UIButton
        button?.isSelected.toggle()
        confirmPwdTextField.textField.isSecureTextEntry.toggle()
    }
    
    @objc private func validatePassword() {
        let pwd = pwdTextField.textField.text ?? ""
        let confirm = confirmPwdTextField.textField.text ?? ""
        
        // atualiza botão em tempo real
        let isEnabled = !pwd.isEmpty && !confirm.isEmpty && pwd == confirm
        handleSignUpButton(isEnabled: isEnabled)
        
        // erro só quando perde o foco
        if confirmPwdTextField.textField.isFirstResponder == false {
            viewModel.passwordIcorrect(password: pwd, confirmPassword: confirm)
        }
    }
    
    private func handleSignUpButton(isEnabled: Bool) {
        SighUpButton.isEnabled = isEnabled
        SighUpButton.alpha = isEnabled ? 1.0 : 0.5
    }
    
    private func showAlert(title: String = "Atenção", message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true)
    }
    
}




import SwiftUI

#Preview {
    SignUpViewController()
}
