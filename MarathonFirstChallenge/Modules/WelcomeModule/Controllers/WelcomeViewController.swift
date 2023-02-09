//
//  WelcomeViewController.swift
//  MarathonFirstChallenge
//
//  Created by demasek on 05.02.2023.
//

// Вариант его реализации в коде
// 1. Создаем переменную и даем ей имя
//    private lazy var anyStackView = UIStackView()
// 2. Реализовывам в функции setupViews()
//    anyStackView = UIStackView(arrangedSubviews: [anyLabel,            - добавляем в stackView эллементы
//                                                     anyImage,    - добавляем в stackView эллементы
//                                                     anyButton],    - добавляем в stackView эллементы
//                                axis: .vertical,                    - указываем какое будет расположение у эллементов
//                                spacing: 5)                        - указываем расстояние между этими эллементами




import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    enum Constants {
        static let backgroundImage: String = "background_image"
        static let rulesImage: String = "rules_image"
        static let logoImage: String = "logo_image"
        static let gameNameText: String = "Who Wants to be a Millionare"
        static let newGameImage: String = "new_game_button"
        static let teamButton: String = "team_button"
    }
    
//    private var anyStackView: UIStackView{
//        let anyStackView = UIStackView()
//        anyStackView.addArrangedSubview(logoImageView)
//        anyStackView.addArrangedSubview(newGameButton)
//        anyStackView.axis = .vertical
//        anyStackView.spacing = 16
//        return anyStackView
//    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.backgroundImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: Constants.rulesImage), for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.logoImage)
        return imageView
    }()
    
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.gameNameText
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .whiteTitleColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var teamButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: Constants.teamButton), for: .normal)
        button.addTarget(self, action: #selector(teamButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: Constants.newGameImage), for: .normal)
        button.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        return button
    }()

    
    //MARK: - Create UI
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(rulesButton)
        view.addSubview(logoImageView)
        view.addSubview(gameNameLabel)
        view.addSubview(teamButton)
        view.addSubview(newGameButton)
//        view.addSubview(anyStackView)
    }

    @objc private func rulesButtonTapped() {
        let rulesText = RulesViewController()
        self.present(rulesText, animated: true, completion: nil)
    }
    
    @objc private func newGameButtonTapped() {
    }
    
    @objc private func teamButtonTapped() {
        let teamText = TeamViewController()
        self.present(teamText, animated: true, completion: nil)
    }
    
    private func setConstraints() {        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14.67),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 323),
            rulesButton.widthAnchor.constraint(equalToConstant: 32),
            rulesButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 163),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 195),
            logoImageView.heightAnchor.constraint(equalToConstant: 195)
        ])
        
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 418),
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameNameLabel.widthAnchor.constraint(equalToConstant: 311)
        ])
        
        teamButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 691),
            teamButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.widthAnchor.constraint(equalToConstant: 70),
            rulesButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 597),
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        anyStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            anyStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 597),
//            anyStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
    }
    
}



