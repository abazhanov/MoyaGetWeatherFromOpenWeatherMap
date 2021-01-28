//
//  ViewController.swift
//  MoyaGetWeatherFromOpenWeatherMap
//
//  Created by Artem Bazhanov on 28.01.2021.
//

import UIKit
import Moya
import ObjectMapper
import Moya_ObjectMapper
import Alamofire

class ViewController: UIViewController {
    var w: Weather? = nil



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getWeather()
    }

    // MARK 1
        private func getWeather(){
                
            let provider = MoyaProvider<RequestManager>(plugins:[NetworkLoggerPlugin()])
                
                provider.request(.getWheather) { result in
                    switch result {
                    case .success(let response):
                        //self.refreshControl.endRefreshing()
                        //self.isLoading = false
                        
                        do {
                            try print(response.mapJSON())
                        } catch {
                            print(error)
                        }
                        if let json = (try? response.mapJSON()) as? [String : Any] {
                            let wheather = Mapper<Weather>().map(JSON: json)
                            self.w =  wheather
                            //self.mergeDataSource(specializations: specializations)
                            print("!!!!!!!!!!wheather!!!!!!!!!!! = \(wheather)")
                            print(wheather?.id ?? "нету тут ничего")

                        }
                    case .failure(let error):
                        //self.isLoading = false
                        //self.refreshControl.endRefreshing()
                        print(error.errorDescription ?? "Unknown error")
                    }
                }
            }
        // END MARK 1
}
