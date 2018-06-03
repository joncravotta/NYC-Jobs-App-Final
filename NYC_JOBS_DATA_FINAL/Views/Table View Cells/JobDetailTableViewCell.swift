//
//  JobDetailTableViewCell.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 6/2/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class JobDetailTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let bottomBorder = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(bottomBorder)
        
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        titleLabel.textColor = .gray
        titleLabel.numberOfLines = 0
        
        bodyLabel.font = UIFont.systemFont(ofSize: 14.0)
        bodyLabel.textColor = .black
        bodyLabel.numberOfLines = 0
        
        bottomBorder.backgroundColor = .lightGray
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
        }
    }
    
    func setUp(withTitle title: String, body: String) {
        titleLabel.text = title
        bodyLabel.text = body
    }
}
