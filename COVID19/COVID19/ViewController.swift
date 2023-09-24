//
//  ViewController.swift
//  COVID19
//
//  Created by 김주현 on 2023/09/23.
//

import UIKit

import Alamofire
import DGCharts

class ViewController: UIViewController {
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var PieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicatorView.startAnimating()
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return }
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden  = true
            self.labelStackView.isHidden = false
            self.PieChartView.isHidden = false
            switch result {
            case let .success(result):
                debugPrint("success \(result)")
                self.configureStackView(koreaCovidOverview: result.korea)
                let covidOverviewList = self.makeCovidOverviewList(cityCovidOverview: result)
                self.configureChartView(covidOverviewList: covidOverviewList)
                
            case let.failure(error):
                debugPrint("success \(error)")
            }
            
        })
    }
    
    func makeCovidOverviewList(cityCovidOverview: CityCovidOverview)->[CovidOverview]{
        return [
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.daegu,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.sejong,
            cityCovidOverview.chungbuk,
            cityCovidOverview.jeju
        ]
    }
    
    func configureChartView(covidOverviewList: [CovidOverview]){
        self.PieChartView.delegate = self
        let entries = covidOverviewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(
                value: self.removeFormatString(string: overview.newCase),
                label: overview.countryName,
                data: overview)
        }
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.valueTextColor = .darkGray
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors = //ChartColorTemplates.vordiplom() +
        ChartColorTemplates.joyful() +
        ChartColorTemplates.liberty() +
        ChartColorTemplates.pastel()
//        ChartColorTemplates.material()
        
        
        self.PieChartView.data = PieChartData(dataSet: dataSet)
        self.PieChartView.spin(duration: 0.3, fromAngle: self.PieChartView.rotationAngle, toAngle: self.PieChartView.rotationAngle+80)
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureStackView(koreaCovidOverview: CovidOverview) {
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }

    
    func fetchCovidOverview(
        //클로저를 정의한 곳
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void //매서드 파라미터로 클로져를 전달받음.
        /*
         서버로 응답을 받거나 / 요청이 실패했을 때
         completionHandler 클로져를 호출 -> 클로져를 정의한 곳에 응답받은 데이터를 전달
         */
    ) {
        let url = "https://api.corona-19.kr/korea/country/new"
        let param = [
            "serviceKey": "lVxfy5UeAOj4SmKzIditHgJR6Bo8kb17C"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in //응답내용이 클로져 파라미터로 전달된다.
                switch response.result { //response.result는 열거형으로 되어있다.
                case let .success(data): //data는 json
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
                
            })
    }

}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CovidDetailViewController") as? CovidDetailViewController else { return }
        guard let covidOverview = entry.data as? CovidOverview else { return }
        covidDetailViewController.covidOverview = covidOverview
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
    }
}
