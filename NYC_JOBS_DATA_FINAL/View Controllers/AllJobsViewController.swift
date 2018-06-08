//
//  JobsViewController.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/28/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AllJobsViewController: UIViewController {
    
    private let jobsViewModel: AllJobsViewModel
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    init() {
        jobsViewModel = AllJobsViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpDefaultNavgationStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpObservers()
    }
    
    private func setUpView() {
        title = "🗽 NYC Jobs"
        view.backgroundColor = .white
        
        // Table View set up
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Search Bar set up
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Jobs..."
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    private func setUpObservers() {
        jobsViewModel.state.producer.startWithValues { [weak self] (state) in
            
            guard let `self` = self else { return }
            
            switch state {
            case .initial: break
            case .updating: break
            case .didUpdate:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .didFailToUpdate: break
            }
        }
    }
}

extension AllJobsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsViewModel.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobTableViewCell
        
        let job = jobsViewModel.jobs[indexPath.row]
        cell.setUp(withJob: job)
        cell.selectionStyle = .none
        
        return cell
    }
}

extension AllJobsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let job = jobsViewModel.jobs[indexPath.row]
        
        let vm = JobViewModel(job: job)
        let vc = JobViewController(jobViewModel: vm)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AllJobsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }
}

extension AllJobsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            jobsViewModel.refreshData(withSearchTerm: searchTerm)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
