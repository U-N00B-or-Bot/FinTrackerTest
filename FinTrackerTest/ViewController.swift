//U-N00B-or-Bot

import UIKit

class ViewController: UIViewController {
    
    
    var currentBalance = 0
    
    let BTCLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let plusBalanceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.tintColor = .red
        return button
    }()
    
    let addTransactionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Add transaction", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 3
       
        button.layer.borderColor = UIColor.systemGreen.cgColor
       
        return button
    }()
    
    let transactionCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        
        view.addSubview(BTCLabel)
        view.addSubview(balanceLabel)
        view.addSubview(plusBalanceButton)
        view.addSubview(addTransactionButton)
        view.addSubview(transactionCollectionView)
        setupBTCLabel()
        setupBalanceLabel()
        setupPlusBalanceButton()
        setupAddTransactionButton()
        setupCollectionView()
        BTCLabel.text = "BTC = 1$"
        balanceLabel.text = "\(currentBalance)$"
    }
    
    @objc func buttonAction(sender: UIButton!) {
        currentBalance += 10
        balanceLabel.text = String(currentBalance) + "$"
            }
    
    @objc func addTransactionAction(sender: UIButton!) {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
            }
        
    
    private func setupBalanceLabel(){
       // let width = view.layer.bounds.width / 3
        balanceLabel.textAlignment = .center
        balanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        balanceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        balanceLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: BTCLabel.bottomAnchor, constant: 30).isActive = true
        
    }

    private func setupBTCLabel(){
        BTCLabel.textAlignment = .center
        BTCLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        BTCLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        BTCLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        BTCLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupPlusBalanceButton(){
        plusBalanceButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        plusBalanceButton.leftAnchor.constraint(equalTo: balanceLabel.rightAnchor, constant: 20).isActive = true
        plusBalanceButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        plusBalanceButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        plusBalanceButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor).isActive = true
        
    }
    
    private func setupAddTransactionButton(){
        addTransactionButton.addTarget(self, action: #selector(addTransactionAction), for: .touchUpInside)
        
        addTransactionButton.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 30).isActive = true
        addTransactionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addTransactionButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        addTransactionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupCollectionView(){
       
       transactionCollectionView.topAnchor.constraint(equalTo: addTransactionButton.bottomAnchor, constant: 30).isActive = true
        transactionCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        transactionCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        transactionCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        transactionCollectionView.backgroundColor = .orange
        
    }
    
    
    

}

