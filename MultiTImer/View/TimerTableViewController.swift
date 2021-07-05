//
//  TimerTableViewController.swift
//  MultiTImer
//
//  Created by macbookp on 04.07.2021.
//

import UIKit

class TimerTableViewController: UITableViewController {
    
    private var timer = Timer()
    private var timers = [TimerInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            for (index,newTimer) in self.timers.enumerated(){
                if newTimer.isPlay {
                    if newTimer.counter >= 0.1 {
                        newTimer.counter -= 0.1
                    } else {
                        self.timers.remove(at: index)
                    }
                }
            }
            self.tableView.reloadSections([1], with: .none)
        })
    }
    
    private func configureTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.8692996625, green: 0.8692996625, blue: 0.8692996625, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TimerCell.self, forCellReuseIdentifier: TimerCell.reuseIdentifier)
        tableView.register(InfoTimerCell.self, forCellReuseIdentifier: InfoTimerCell.reuseIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return timers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTimerCell.reuseIdentifier, for: indexPath) as! InfoTimerCell
            cell.configure()
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TimerCell.reuseIdentifier, for: indexPath) as! TimerCell
            cell.makeConstraints()
            cell.configure(name: timers[indexPath.row].name, time: timers[indexPath.row].counter)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            timers[indexPath.row].isPlay = !timers[indexPath.row].isPlay
            timers.sort { $0.counter < $1.counter }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Добавление таймеров"
        } else {
            return "Таймеры"
        }
    }
    
}

//MARK: - InfoTimerCellDelegate

extension TimerTableViewController: InfoTimerCellDelegate {
    func addTimer(nameText: String?, timeText: String?) {
        guard let name = nameText, name != ""  else {
            alertWrongText(title: "Введите имя таймера")
            return
        }
        guard let time = Double(timeText!) else {
            alertWrongText(title: "Некорректное время для таймера")
            return
        }
        if time < 86401 {
            if timers.count < 10 {
                let newTimer = TimerInfo(name: name, counter: time, isPlay: true)
                timers.append(newTimer)
                timers.sort { $0.counter < $1.counter }
                tableView.reloadData()
            } else {
                alertWrongText(title: "Максимальное количество таймеров - 10")
            }
        } else {
            alertWrongText(title: "Максимальное время таймера - 24 часа")
        }
    }
}
