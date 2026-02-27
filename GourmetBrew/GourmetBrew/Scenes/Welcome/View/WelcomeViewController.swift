//
//  WelcomeViewController.swift
//  GourmetBrew
//
//  Created by admin on 26/02/26.
//

import UIKit
import DesignSystem

final class WelcomeViewController: UIViewController {

    // MARK: - Background

    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "WelcomeBackground")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    // MARK: - Brand (topo)

    private let brandStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = DSSpacing.xs
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()


    private let brandIconLabel: UIImageView = {
        let l = UIImageView()
        l.image = UIImage(named: "CoffeeIcon")
        return l
    }()

    private let brandNameLabel: DSLabel = {
        let l = DSLabel(fontSize: .body, fontWeight: .semibold, color: .white)
        l.text = "GOURMET BREW"
        
        return l
    }()

    // MARK: - Bottom Content

    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = DSSpacing.xs
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let titleLabel: DSLabel = {
        let l = DSLabel(fontSize: .largeTitle, fontWeight: .bold, color: .white)
        l.text = "A Arte do"
        l.textAlignment = .center
        return l
    }()

    private let titleItalicLabel: DSLabel = {
        let l = DSLabel(fontSize: .largeTitle, fontWeight: .bold, color: DSColors.brandSecondary)
        l.text = "Grão Perfeito"
        l.textAlignment = .center
        l.font = UIFont(name: "Georgia-Italic", size: 36)
        return l
    }()

    private let subtitleLabel: DSLabel = {
        let l = DSLabel(fontSize: .body, fontWeight: .regular, color: UIColor.white.withAlphaComponent(0.65))
        l.text = "Experimente a sofisticação em cada xícara.\nPeça seu café gourmet com rapidez, qualidade e paixão."
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()

    // MARK: - Page Dots

    private let dotsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 7
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    // MARK: - Buttons

    private lazy var startButton: DSButton = {
        let b = DSButton(variant: .primary, size: .large)
        b.setTitle("Começar →", for: .normal)
        b.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    private let loginLabel: DSLabel = {
        let l = DSLabel(fontSize: .footnote, fontWeight: .regular, color: UIColor.white.withAlphaComponent(0.5))
        l.textAlignment = .center
        let text = "Já tem uma conta? Entrar"
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttribute(.foregroundColor, value: DSColors.brandPrimary, range: (text as NSString).range(of: "Entrar"))
        l.attributedText = attributed
        l.isUserInteractionEnabled = true
        return l
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupDots(total: 3, active: 0)
        setupLoginTap()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubviews(backgroundImageView)

        // Brand
        brandStackView.addArrangedSubview(brandIconLabel)
        brandStackView.addArrangedSubview(brandNameLabel)
        view.addSubview(brandStackView)

        // Content stack
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(titleItalicLabel)
        contentStackView.setCustomSpacing(DSSpacing.sm, after: titleItalicLabel)
        contentStackView.addArrangedSubview(subtitleLabel)
        contentStackView.setCustomSpacing(DSSpacing.md, after: subtitleLabel)
        contentStackView.addArrangedSubview(dotsStackView)
        contentStackView.setCustomSpacing(DSSpacing.md, after: dotsStackView)
        contentStackView.addArrangedSubview(startButton)
        contentStackView.setCustomSpacing(DSSpacing.sm, after: startButton)
        contentStackView.addArrangedSubview(loginLabel)
        view.addSubview(contentStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // Background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            

            brandStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DSSpacing.md),
            brandStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Content
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DSSpacing.lg),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -DSSpacing.lg),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DSSpacing.lg),

            // Button width
            startButton.widthAnchor.constraint(equalTo: contentStackView.widthAnchor),
        ])
    }

    private func setupDots(total: Int, active: Int) {
        dotsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for i in 0..<total {
            let dot = UIView()
            dot.backgroundColor = i == active
            ? DSColors.backgroundPrimary
                : UIColor.white.withAlphaComponent(0.3)
            dot.layer.cornerRadius = 4
            dot.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dot.widthAnchor.constraint(equalToConstant: i == active ? 22 : 8),
                dot.heightAnchor.constraint(equalToConstant: 8)
            ])
            dotsStackView.addArrangedSubview(dot)
        }
    }

    private func setupLoginTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        loginLabel.addGestureRecognizer(tap)
    }

    // MARK: - Actions
    
    

    @objc private func startTapped() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

    @objc private func loginTapped() {
        // Navegar pra tela de login
    }
    
    
}

import SwiftUI

#Preview {
    WelcomeViewController()
}
