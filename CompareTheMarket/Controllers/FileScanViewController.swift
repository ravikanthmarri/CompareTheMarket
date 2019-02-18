//
//  FileScanViewController.swift
//  CompareTheMarket
//
//  Created by R K Marri on 16/02/2019.
//  Copyright © 2019 R K Marri. All rights reserved.
//

import UIKit

class FileScanViewController: UIViewController {
    
    @IBOutlet weak var resultTextView: UITextView!
    var loadService: Service
    var wordCountService: WordCountService
    var primeNumberService: PrimeNumber
    var urlString: String
    
    init(loadService: Service,wordCountService: WordCountService, primeNumberService:PrimeNumber, urlString:String) {
        self.loadService = loadService
        self.wordCountService = wordCountService
        self.primeNumberService = primeNumberService
        self.urlString = urlString
        super.init(nibName: "FileScanViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadService.load(from: urlString) { [weak self] (loadResult) in
            
            guard let strongSelf = self else { return }
            
            switch loadResult {
            case let .failure(error):
                print(error)
            case let .success(data):
                DispatchQueue.main.async {
                    strongSelf.processResult(with: data)
                }
            }
        }
    }
    
    func processResult(with result: String) {
        
        var displayString = ""
        wordCountService.countWords(in: result).forEach {
            if primeNumberService.isPrimeNumber(number: $1){
                displayString.append("\($0) : \($1) ==> Prime number \n")
            }else{
                displayString.append("\($0) : \($1) \n")
            }
        }
        resultTextView.text = displayString
    }
    
}
