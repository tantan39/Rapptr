//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages: [Message]?
    
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        client = ChatClient();
        messages = [Message]()
        
        fetchChatMessage()
        configureTable(tableView: chatTable)
        title = "Chat"
        
        // TODO: Remove test data when we have actual data from the server loaded
//        messages?.append(Message(testName: "James", withTestMessage: "Hey Guys!"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"What's up?"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"Hey! :)"))
//        messages?.append(Message(testName:"James", withTestMessage:"Want to grab some food later?"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"Sure, time and place?"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"YAS! I am starving!!!"))
//        messages?.append(Message(testName:"James", withTestMessage:"1 hr at the Local Burger sound good?"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"Sure thing"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"See you there :P"))
        
    }
    
    // MARK: - Private
    private func fetchChatMessage() {
        client?.fetchChatData({ [weak self] (data) in
            guard let self = self,let messages = data  else { return }
            self.messages = messages
            DispatchQueue.main.async {
                self.chatTable.reloadData()
            }
            
        }, withError: { (error) in
            let ok = UIAlertAction(title: "OK", style: .default) { _ in }
            let alert = UIAlertController(title: "Alert", message: error ?? "", preferredStyle: .alert)
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundView?.backgroundColor = .viewBackground
        tableView.backgroundColor = .viewBackground
        
        tableView.estimatedRowHeight = 160
        tableView.separatorStyle = .none
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatTableViewCell? = nil
        if cell == nil {
            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
            cell = nibs?[0] as? ChatTableViewCell
        }
        cell?.setCellData(message: messages![indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages?.count ?? 0
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - IBAction
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
}
