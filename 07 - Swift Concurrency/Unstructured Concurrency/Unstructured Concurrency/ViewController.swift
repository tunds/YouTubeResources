//
//  ViewController.swift
//  Unstructured Concurrency
//
//  Created by Tunde on 20/09/2021.
//

import UIKit

struct PhotoService {
    
    enum ContentError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    func download(_ url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw ContentError.invalidRequest
              }
        return data
    }
}

class ViewController: UIViewController {

    private let vm = ImagesViewModel()
    private let service = PhotoService()
    
    private let tv: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.cellId)
        return tv
    }()
    
    override func loadView() {
        super.loadView()
        setup()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.cellId,
                                                 for: indexPath) as? PhotoTableViewCell
        return cell!
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView,
                   didEndDisplaying cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
    }
}

private extension ViewController {
    
    func setup() {
        
        tv.dataSource = self
        tv.delegate = self
        
        self.view.addSubview(tv)
        
        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: view.topAnchor),
            tv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tv.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
