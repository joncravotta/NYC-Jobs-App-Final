//
//  JobViewController.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 6/2/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class JobViewController: UIViewController {
    
    private let jobViewModel: JobViewModel
    private let tableView = UITableView()
    
    init(jobViewModel: JobViewModel) {
        self.jobViewModel = jobViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        // Table View set up
        tableView.register(JobTitleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(JobDetailTableViewCell.self, forCellReuseIdentifier: "detail-cell")
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorStyle = .none
        
        let applyButton = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(applyButtonAction))
        navigationItem.setRightBarButton(applyButton, animated: true)
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func applyButtonAction() {
        let alert = UIAlertController(title: "How to apply", message: jobViewModel.howToApply, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension JobViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobViewModel.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let viewData = jobViewModel.cellData[indexPath.row]
        switch viewData {
        case let .title(title, indicator):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobTitleTableViewCell
            cell.setUp(withTitle: title, indicator: indicator)
            return cell
        
        case let .default(title, body):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail-cell", for: indexPath) as! JobDetailTableViewCell
            cell.setUp(withTitle: title, body: body)
            
            return cell
        }
        
        
    }
}
