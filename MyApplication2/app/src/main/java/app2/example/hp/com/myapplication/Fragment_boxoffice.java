package app2.example.hp.com.myapplication;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class Fragment_boxoffice extends android.support.v4.app.Fragment {
    private ImageLoader imageLoader;
    // private static final String URL_ROTTEN_TOMATOES_BOX_OFFICE = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json";
    private VolleySingelton volleySingelton;
    public static final String KEY_MOVIES = "movies";
    public static final String KEY_ID = "id";
    public static final String KEY_TITLE = "title";
    public static final String KEY_RELEASE_DATE = "release_dates";
    public static final String KEY_THEATER = "theater";
    public static final String KEY_RATING = "ratings";
    public static final String KEY_AUDIENCE_SCORE = "audience_score";
    public static final String KEY_SYNOPSIS = "synopsis";
    public static final String KEY_POSTERS = "posters";
    public static final String KEY_THUMBNAIL = "thumbnail";
    public static final String KEY_LINKS = "links";
    public static final String KEY_SELF = "self";
    public static final String KEY_CAST = "cast";
    public static final String KEY_REVIEWS = "reviews";
    public static final String KEY_SIMILAR = "similar";
    public static final String URL_BOX_OFFICE = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json";
    public static final String URL_CHAR_QUESION = "?";
    public static final String URL_CHAR_AMEPERSTAND = "&";
    public static final String URL_PARAM_API_KEY = "apikey=";
    public static final String URL_PARAM_LIMIT = "limit=";




    private RequestQueue requestQueue;
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    ArrayList<Movies> listMovies = new ArrayList<>();
    private RecyclerView listMovieHits;
    private AdapterBoxOffice adapterBoxOffice;
    //private ArrayList<Movies> listMovies;

    public static Fragment_boxoffice getInstance() {
        Fragment_boxoffice myFragment = new Fragment_boxoffice();
        return myFragment;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        volleySingelton = VolleySingelton.getsInstance();
        requestQueue = volleySingelton.getRequestQueue();
        sendJasonRequest();
        /*JsonObjectRequest request = new JsonObjectRequest(Request.Method.GET, getRequestUrl(10), null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                L.t(getActivity(),response.toString());

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
            }
        });
        requestQueue.add(request);*/
    }

    private void sendJasonRequest() {


        JsonObjectRequest request;
        request = new JsonObjectRequest(Request.Method.GET, getRequestUrl(10),
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        listMovies = parseJSONResponce(response);
                        adapterBoxOffice.setmoviesList(listMovies);
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
            }
        });
        requestQueue.add(request);
    }

    private ArrayList<Movies> parseJSONResponce(JSONObject response) {
        ArrayList<Movies> listMovies = new ArrayList<>();
        if (response == null || response.length() == 0) {
            return listMovies;
        }
        try {
            StringBuilder data = new StringBuilder();
            JSONArray arrayMovies = response.getJSONArray(KEY_MOVIES);
            for (int i = 0; i < arrayMovies.length(); i++) {
                JSONObject currentmovie = arrayMovies.getJSONObject(i);
                Long id = currentmovie.getLong(KEY_ID);
                String title = currentmovie.getString(KEY_TITLE);
                JSONObject objectReleaseDate = currentmovie.getJSONObject(KEY_RELEASE_DATE);
                Date date = null;
                String releaseDate = null;
                if (objectReleaseDate.has(KEY_THEATER)) {
                    releaseDate = objectReleaseDate.getString(KEY_THEATER);

                } else {
                    releaseDate = "Not Available";
                }
                try {

                    date = formatter.parse(releaseDate);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                JSONObject objectRating = currentmovie.getJSONObject(KEY_RATING);
                int audienceRating = -1;
                if (objectRating.has(KEY_AUDIENCE_SCORE)) {
                    audienceRating = objectRating.getInt(KEY_AUDIENCE_SCORE);
                }
                String synopsis = currentmovie.getString(KEY_SYNOPSIS);
                JSONObject objectposters = currentmovie.getJSONObject(KEY_POSTERS);
                String urlThumbnail = null;
                if (objectposters.has(KEY_THUMBNAIL)) {
                    urlThumbnail = objectposters.getString(KEY_THUMBNAIL);
                }

                data.append("" + id + title + synopsis + date + audienceRating + urlThumbnail + "\n");
                Movies movie = new Movies(id, title, date, audienceRating, synopsis, urlThumbnail, "", "", "");
                listMovies.add(movie);

            }
            // L.t(getActivity(), data.toString());
        } catch (JSONException e) {
        }
        return listMovies;
    }

    public static String getRequestUrl(int limit) {
        return URL_BOX_OFFICE
                + URL_CHAR_QUESION
                + URL_PARAM_API_KEY
                + MynewApplication.API_KEY_ROTTENTOMATOES
                + URL_CHAR_AMEPERSTAND
                + URL_PARAM_LIMIT + limit;
        // return URL_ROTTEN_TOMATOES_BOX_OFFICE + "?apikey=" + MynewApplication.API_KEY_ROTTENTOMATOES + "&limit=" + limit;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View layout = inflater.inflate(R.layout.fragment_fragment_boxoffice, container, false);
        layout.setScrollContainer(true);
        layout.setVerticalScrollBarEnabled(true);
        listMovieHits = (RecyclerView) layout.findViewById(R.id.listMovieHits);
        listMovieHits.setLayoutManager(new LinearLayoutManager(getActivity()));
        adapterBoxOffice = new AdapterBoxOffice(getActivity());
        listMovieHits.setAdapter(adapterBoxOffice);
        listMovieHits.setScrollContainer(true);
        sendJasonRequest();
        return layout;
    }
}