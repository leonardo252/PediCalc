//
//  BodySurfaceView.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 10/02/21.
//

import UIKit

class BodySurfaceView: UIView {
    
    var viewModel: CalculatorsViewModel? {
        didSet {
            updateUI()
        }
    }
    
    var bodySurface: BodySurface!
    
    private let calcName: UILabel = {
       let name = UILabel()
        name.text = "Superfície Corporal"
        name.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        name.adjustsFontForContentSizeCategory = true
        return name
    }()
    
    private let weightLabel: UILabel = {
       let name = UILabel()
        name.text = "Peso"
        name.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        name.adjustsFontForContentSizeCategory = true
        return name
    }()
    
    let weightInput: UITextField = {
       let input = UITextField()
        input.placeholder = "Kg"
        input.borderStyle = .roundedRect
        input.backgroundColor = .white
        input.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        input.keyboardType = .numberPad
        return input
    }()
    
    private let heightLabel: UILabel = {
       let name = UILabel()
        name.text = "Altura"
        name.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        name.adjustsFontForContentSizeCategory = true
        return name
    }()
    
    let heightInput: UITextField = {
       let input = UITextField()
        input.placeholder = "Cm"
        input.borderStyle = .roundedRect
        input.backgroundColor = .white
        input.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        input.keyboardType = .numberPad
        return input
    }()
    
    let buttonCalc: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: "ActionColor")
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 34)
        button.setTitle("Calcular", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resultLabel: UILabel = {
       let name = UILabel()
        name.text = "Resultado"
        name.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        name.adjustsFontForContentSizeCategory = true
        return name
    }()
    
    let outPutResult: UITextField = {
        let input = UITextField()
        input.placeholder = "m²"
        input.borderStyle = .roundedRect
        input.backgroundColor = .white
        input.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        input.isUserInteractionEnabled = false
        return input
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCalcName()
        setupWeight()
        setupHeight()
        setupButton()
        setupResult()
        setupTextFields()
    }
    
    func setupTextFields() {
            let toolbar = UIToolbar()
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                             target: self, action: #selector(doneButtonTapped))
            
            toolbar.setItems([flexSpace, doneButton], animated: true)
            toolbar.sizeToFit()
            
            heightInput.inputAccessoryView = toolbar
            weightInput.inputAccessoryView = toolbar
        }
    
    @objc func doneButtonTapped() {
            self.endEditing(true)
        }
    
    @objc func buttonTapped() {
        print("Button Tapped!")
        
        guard let height = heightInput.text, let weight = weightInput.text else { print("Invalid input"); return }
        
        if height == "" || weight == "" {
            print("Nill Value")
        } else {
            
            print(height, weight)
            bodySurface = BodySurface(weight: weight, height: height, bodySuface: 0)
        
            viewModel = CalculatorsViewModel(measures: bodySurface)
        }
        
    }
    
    private func updateUI() {
        guard let surface = viewModel?.bodySurface.bodySuface else { return }
        outPutResult.text = String(format: "%f m²", surface)
    }
    
    func setupCalcName() {
        addSubview(calcName)
        calcName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calcName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            calcName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    func setupWeight() {
        setupWeighLabel()
        setupWeightInput()
    }
    
    func setupWeighLabel() {
        addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: calcName.bottomAnchor, multiplier: 2),
            weightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22)
            
        ])
    }
    
    func setupWeightInput() {
        addSubview(weightInput)
        weightInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weightInput.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            weightInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            weightInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22)
        ])
    }
    
    func setupHeight() {
        setupHeightLabel()
        setupHeightInput()
    }
    
    func setupHeightLabel() {
        addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: weightInput.bottomAnchor, multiplier: 2),
            heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22)
            
        ])
    }
    
    func setupHeightInput() {
        addSubview(heightInput)
        heightInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightInput.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            heightInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            heightInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22)
        ])
    }
    
    func setupButton() {
        addSubview(buttonCalc)
        buttonCalc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonCalc.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonCalc.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            buttonCalc.widthAnchor.constraint(equalToConstant: 134)
        ])
    }
    
    func setupResult() {
        setupResultOutput()
        setupResultLable()
    }
    
    func setupResultOutput() {
        addSubview(outPutResult)
        outPutResult.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            outPutResult.bottomAnchor.constraint(equalTo: buttonCalc.topAnchor, constant: -12),
            outPutResult.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            outPutResult.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            outPutResult.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -44),
            outPutResult.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setupResultLable() {
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: outPutResult.topAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
