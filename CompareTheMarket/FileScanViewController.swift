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
        let fileContent = loadService.load(from: urlString)
        var resultString = ""
        wordCountService.countWords(in: fileContent).forEach {
            if primeNumberService.isPrimeNumber(number: $1){
                resultString.append("\($0) : \($1) ==> Prime number \n")
            }else{
                resultString.append("\($0) : \($1) \n")
            }
        }
        resultTextView.text = resultString
    }

}
