package app2.example.hp.com.myapplication;

import android.app.Application;
import android.content.Context;

/**
 * Created by SIDDHARTH on 1/4/2016.
 */
public class MynewApplication extends Application {
    public static final String API_KEY_ROTTENTOMATOES = "54wzfswsa4qmjg8hjwa64d4c";

    public static MynewApplication sInstance;

    @Override
    public void onCreate() {
        super.onCreate();
        sInstance = this;
    }

    public static MynewApplication getsInstance() {
        return sInstance;
    }

    public static Context getAppContext() {
        return sInstance.getApplicationContext();
    }
}