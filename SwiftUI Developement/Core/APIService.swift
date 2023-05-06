import Foundation

class APIService {
    
    func getAccount(completion: @escaping (AccountInfo) -> ()) {
        guard let url = URL(string: "\(API_BASE_URL)accounts")
        else { fatalError("URL is not correct!") }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let account = try! JSONDecoder().decode(AccountInfo.self, from: data!)
            DispatchQueue.main.async {
                print(account)
                completion(account)
            }
        }
        .resume()
    }
    
    func getRewards(completion: @escaping (RewardsInfo) -> ()) {
        guard let url = URL(string: "\(API_BASE_URL)rewards")
        else { fatalError("URL is not correct!") }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let account = try! JSONDecoder().decode(RewardsInfo.self, from: data!)
            DispatchQueue.main.async {
                print(account)
                completion(account)
            }
        }
        .resume()
    }
    
    func getTransactionDetail(id: String, completion: @escaping (Transaction) -> ()) {
        guard let url = URL(string: "\(API_BASE_URL)rewards/transactions/\(id)")
        else { fatalError("URL is not correct!") }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let account = try? JSONDecoder().decode(Transaction.self, from: data!) {
                DispatchQueue.main.async {
                    print(account)
                    completion(account)
                }
            }
        }
        .resume()
    }
}
