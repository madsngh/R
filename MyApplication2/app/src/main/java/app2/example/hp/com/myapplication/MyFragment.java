package app2.example.hp.com.myapplication;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

/**
 * Created by SIDDHARTH on 1/2/2016.
 */
public class MyFragment extends android.support.v4.app.Fragment {

    public static MyFragment getInstance() {
        MyFragment myFragment = new MyFragment();
        return myFragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_my, container, false);


        TextView textView1 = (TextView) rootView.findViewById(R.id.section_label);
        //layout.setVerticalScrollBarEnabled(true);
        TextView textView2 = (TextView) rootView.findViewById(R.id.nytextview1);
        TextView textView3 = (TextView) rootView.findViewById(R.id.nytextview2);
        TextView textView4 = (TextView) rootView.findViewById(R.id.nytextview3);
        TextView textView5= (TextView) rootView.findViewById(R.id.nytextview5);
        TextView textView6 = (TextView) rootView.findViewById(R.id.nytextview6);
        TextView textView7 = (TextView) rootView.findViewById(R.id.nytextview7);
        TextView textView8 = (TextView) rootView.findViewById(R.id.nytextview7);
        TextView textView9 = (TextView) rootView.findViewById(R.id.nytextview8);
        TextView textView10 = (TextView) rootView.findViewById(R.id.nytextview9);
        TextView textView = (TextView) rootView.findViewById(R.id.nytextview10);
        //textView.setText(getString(R.string.section_format, getArguments().getInt(ARG_SECTION_NUMBER)));
        textView1.setText("HELLO");
        textView2.setText("HELLO");
        textView4.setText("HELLO");
        textView5.setText("HELLO");
        textView6.setText("HELLO");
        textView7.setText("HELLO");
        textView8.setText("HELLO");
        textView9.setText("HELLO");
        textView10.setText("HELLO");
        textView3.setText("HELLO");
        textView1.setText("HELLO");
        rootView.setVerticalScrollBarEnabled(true);
        rootView.setScrollContainer(true);

        return rootView;
    }
}