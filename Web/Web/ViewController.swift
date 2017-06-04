//
//  ViewController.swift
//  Web
//
//  Created by byunhyeongwon on 2017. 6. 1..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        
        let myUrl = URL(string: url);
        let myRequest = URLRequest(url: myUrl!);
        myWebView.loadRequest(myRequest);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myWebView.delegate = self;
        loadWebPage("http://2sam.net");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        
        myActivityIndicator.startAnimating();
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        
        myActivityIndicator.stopAnimating();
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url;
        let flag = strUrl.hasPrefix("http://");
        if !flag {
            
            strUrl = "http://" + strUrl;
        }
        
        return strUrl;
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        
        let myUrl = checkUrl(txtUrl.text!);
        txtUrl.text = "";
        loadWebPage(myUrl);
    }
   

    @IBAction func btnGoSite1(_ sender: UIButton) {
        
        loadWebPage("html://fallinmac.tistory.com");
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        
        loadWebPage("http://blog.2sam.net");
        
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://2sam.net\">2sam</a>으로 이동<p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil);
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        
        let myHtmlBundle = Bundle.main;
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html");
        loadWebPage(filePath!);
        
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        
        myWebView.stopLoading();
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        
        myWebView.reload();
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        
        myWebView.goBack();
        
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        
        myWebView.goForward();
        
    }
    
    
}

