package app2.example.hp.com.myapplication;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

public class Fragment_search extends android.support.v4.app.Fragment {


    public static Fragment_search getInstance() {
        Fragment_search myFragment = new Fragment_search();
        return myFragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View layout = inflater.inflate(R.layout.fragment_search, container, false);
        RequestQueue requestQueue = VolleySingelton.getsInstance().getRequestQueue();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://www.php.net/", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Toast.makeText(getActivity(), "Responce" + response, Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getActivity(), "Error" + error.getMessage(), Toast.LENGTH_SHORT).show();

            }
        });
        return layout;
    }
}
