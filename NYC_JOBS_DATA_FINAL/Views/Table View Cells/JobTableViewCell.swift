//
//  JobTableViewCell.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 5/29/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class JobTableViewCell: UITableViewCell {
    
    private let bubbleView = WorkTimeBubbleView()
    private let titleLabel = UILabel()
    private let agencyLabel = UILabel()
    private let salaryLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(bubbleView)
        addSubview(titleLabel)
        addSubview(agencyLabel)
        addSubview(salaryLabel)
        
        bubbleView.layer.cornerRadius = 12
        
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .regular)
        titleLabel.numberOfLines = 0
        
        agencyLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        agencyLabel.textColor = .gray
        
        salaryLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        salaryLabel.textColor = .gray
        
        bubbleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(24)
            make.leading.equalTo(titleLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleView.snp.bottom).offset(7)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        
        agencyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        
        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(agencyLabel.snp.bottom).offset(3)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func setUp(withJob job: Job) {
        bubbleView.setUp(with: job.indicator)
        titleLabel.text = job.title
        agencyLabel.text = job.agency
        salaryLabel.text = "$\(job.salaryRangeFrom) - $\(job.salaryRangeTo) \(job.salaryFrequency.formattedSalaryString)"
    }
}

private extension WorkTimeIndicator {
    var backgroundColor: UIColor {
        switch self {
        case .fullTime: return .customBlue
        case .partTime: return .customPink
        }
    }
    
    var title: String {
        switch self {
        case .fullTime: return "Full Time"
        case .partTime: return "Part Time"
        }
    }
}

class WorkTimeBubbleView: UIView {
    
    let label = UILabel()
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUp() {
        
        label.font = UIFont.systemFont(ofSize: 10.0, weight: .black)
        label.textColor = .white
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func setUp(with indicator: WorkTimeIndicator) {
        backgroundColor = indicator.backgroundColor
        label.text = indicator.title
    }
}
