package app2.example.hp.com.myapplication;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

/**
 * Created by SIDDHARTH on 1/3/2016.
 */
public class MyFragment2 extends android.support.v4.app.Fragment {
    WebView webView;

    public static MyFragment2 getInstance() {
        MyFragment2 myFagment2 = new MyFragment2();
        return myFagment2;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View layout = inflater.inflate(R.layout.fragment_my2, container, false);
        RequestQueue requestQueue = Volley.newRequestQueue(getActivity());
        webView = (WebView) layout.findViewById(R.id.mywebview);
        //layout.setVerticalScrollBarEnabled(true);
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        layout.setVerticalScrollBarEnabled(true);
        layout.setScrollContainer(true);
        webView.loadUrl("http://www.shiksha.com/");
        webView.setVerticalScrollBarEnabled(true);
        webView.setScrollContainer(true);

        return layout;
    }
}
