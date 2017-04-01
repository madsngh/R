package app2.example.hp.com.myapplication;

import android.graphics.Bitmap;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.Volley;

/**
 * Created by SIDDHARTH on 1/2/2016.
 */
public class VolleySingelton {
    private static VolleySingelton sInstance = null;
    private RequestQueue mRequestQueue;
    private ImageLoader mimageLoader;

    private VolleySingelton() {
        mRequestQueue = Volley.newRequestQueue(MynewApplication.getAppContext());
        mimageLoader = new ImageLoader(mRequestQueue, new ImageLoader.ImageCache() {
            @Override
            public Bitmap getBitmap(String url) {
                return null;
            }

            @Override
            public void putBitmap(String url, Bitmap bitmap) {

            }
        });
    }

    public static VolleySingelton getsInstance() {
        if (sInstance == null) {
            sInstance = new VolleySingelton();
        }
        return sInstance;
    }


    public RequestQueue getRequestQueue() {
        return mRequestQueue;
    }

    public ImageLoader getImageLoader() {
        return mimageLoader;
    }
}
